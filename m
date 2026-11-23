Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0071606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4R112pq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJI8Ez1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/myQxVwBGatEya0bvaatkH8WGVvA8hp8Uie/NDgTxTo=; b=o4R112pqj7bXRE
	oCaQho9E6+X6LcPai0QYjcO5XHHqY4xcLz00Zkq/GsyzsERTn8PNpzKTaYFEMTxvc9/rviIUn3bRW
	IYMcaFop8dOXVwJ1RoobEvbJ/XEXjLug/e0tNh/gF5YSgIIakkR41bYY48gNUg5KQO555wtcbl+nm
	Jkb4RtgAcH/fGT+KGAQkqscpcGHBX7R474WzvVqirjzMZTgZ2kUIaETEMymBHVz/YcbAJB9A1Ext7
	YAQfnjDKcCoxJUcNGsDGRqYS+34gzvrJS7cDyDiLhyioPX5ZZBIh3u8gkqk5ctcdoEHowVaxO3NOb
	5QHmaNoEfFZpExjyH8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpeA-00000006Vwd-1lj1;
	Tue, 24 Nov 2026 12:29:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpde-00000006VrK-3BER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:28:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41E9C40A9E;
	Tue, 24 Nov 2026 12:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4331F0089E;
	Tue, 24 Nov 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523326;
	bh=/myQxVwBGatEya0bvaatkH8WGVvA8hp8Uie/NDgTxTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FJI8Ez1coksaOFZBl+Tt+V0lzPFKxNxU8ifqRlBElxuj0Rwx5vfAxqrVbhJzfhB9g
	 B4JC0/DyxVR02Lg3ZVnvEgM5PDeNUsLXLgUdefMEaCPzhEQ4158/nM6qdwS+PcpaXI
	 bjMMgg9YMr/Olw2MBHs3a/KrQXKscPuQqe5oP0oGnsFb9ZyAfrzgmZZZt4mE6LVuLL
	 zLI/nRffhxaDNnQRki3LRsTiwyuC3HbgPwjSnMNl9fM/kNmj/JuZ+cEZDlt0Z8+Dm0
	 y0wxJCrSQis2sgHBQAn2XFMuM/uLm1NPstJ82eJsOO830+F8eUCQUPhPrWftCP+T1Q
	 cmgq8FIMr/kdQ==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, ranjit.waghmode@xilinx.com, 
 Srikanth Boyapally <srikanth.boyapally@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, git@amd.com
In-Reply-To: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
References: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
Subject: Re: [PATCH 0/5] spi: spi-zynqmp-gqspi: Fix remove and IO-mode
 reads
Message-Id: <179546075004.25092.12167808449795395139.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:05:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3CsvrBpOzx0ATu/gP5GIgfz4fWC33UG1X5kPugufffQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZm377VYpxr2FqSumznSm0gHFxaYdb7MZrZfcuHVC60
 WMRrHuwo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNh62BkuH1HfuWLSQaW63hX
 H/Nk13vBumPJ3uPbH5+bzftHroB70ylGhktTZjl8/vrfeqGjicC1hP4Ui07HL8bRK+9y+0wvdF+
 9mgUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 15 Nov 2026 22:26:39 +0530, Srikanth Boyapally wrote:
> spi: spi-zynqmp-gqspi: Fix remove and IO-mode reads
> 
> This series includes improvements to the ZynqMP GQSPI driver, covering
> unaligned RX buffer handling, controller shutdown during remove,
> interrupt and clock handling, and RX FIFO draining in IO mode.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/5] spi: spi-zynqmp-gqspi: Factor out zynqmp_qspi_disable_hw()
      https://git.kernel.org/broonie/spi/c/128166704b97
[2/5] spi: spi-zynqmp-gqspi: Mask the interrupt before gating clocks on remove
      https://git.kernel.org/broonie/spi/c/e822c0e154ac
[3/5] spi: spi-zynqmp-gqspi: Stop the controller fully on remove
      https://git.kernel.org/broonie/spi/c/1cd11b56fc3d
[4/5] spi: spi-zynqmp-gqspi: Drain RX FIFO on RXNEMPTY in IO mode
      https://git.kernel.org/broonie/spi/c/bfc9ad332132
[5/5] spi: spi-zynqmp-gqspi: Use IO mode if RX buffer is not cache-line aligned
      https://git.kernel.org/broonie/spi/c/07edbea685d7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



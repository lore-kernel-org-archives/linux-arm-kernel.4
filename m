Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF52606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fp1kDspk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGiSysfj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+tm4BTgPIBAp6plHBDahXEWTBlRuFrOeb/xwJ8hxjCg=; b=Fp1kDspkv7VuPt
	PWu8EwWt7N53AENt+qSEScM9ky4qFY0DY6Y2Jmg3+fIjum2MAUPJOjcUkSUeMkzNzkEZjUqogNieP
	LwUeSyuS83nfVOyYygz2yc83tKIIiIkkCowmLR67RR8CIIV6atKyzORK4Xmrq8qi6T1h443eY8RD0
	FPmpOi3PPwtmV1YgGYymF5mwznGe/YWMG556wMHjrHILy6QAc7fw2qiUXXwDjf6IyhXJQg/FiWPQ/
	OykvthQhrshzgA8v5IOUAknD9+bLVxTKOcD1YGeUNOJP2b0YMJmphG3lU0HX/xZpwiwsc/mdKug9V
	COsmf5RcDevYevUCEN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ47P-0000000GH8K-093h;
	Sun, 08 Nov 2026 14:43:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ47N-0000000GH82-3GMc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:43:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F48440B55;
	Sun,  8 Nov 2026 14:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4CD1F0089F;
	Sun,  8 Nov 2026 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794149017;
	bh=+tm4BTgPIBAp6plHBDahXEWTBlRuFrOeb/xwJ8hxjCg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kGiSysfj8kybVExITvIa+Rgny3CtFnYPEHPOMdnhj22NbAlhnmy6lZgGJbZeLuE68
	 grHW2l5ETugYjbqt+olg0hmCxMet4DY9rcqoblhoGP5rQzdf5L4VSK9i79FxqtCYPh
	 UvxBu/oPZejSjxcC7fp522TVbY2NiIyIply5YT3LqBn9MaRuKd/ws574umzmPm7Ete
	 druprc/WJ+WFFWdzFWPokJ5MfMogoAy0Y4vbIkl+KRxYCRaC7h6uatklEB/W7IrY4s
	 Z3ahnI2cJsA0vBb5645z1v1TlQO6UP60UIsO/Pctn//txxC90ubq6AOQsTIoehfBk+
	 4ms8nbsz1ZQSA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AA0E22CCC443;
	Sun, 08 Nov 2026 14:43:34 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 0/2] spi: zynq-qspi: use a flash larger than 16 MiB
From: Mark Brown <broonie@kernel.org>
To: Mario Behn <mario.behn@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105203734.979168-1-mario.behn@gmail.com>
References: <20261105203734.979168-1-mario.behn@gmail.com>
Date: Sun, 08 Nov 2026 14:43:32 +0000
Message-Id: <179414901284.3711751.10991353733886072058.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=364; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pqc5RxFKFgQ0bMGkW74l/iVdEQnONDkkAA36niVKYPg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+dE07pszyzk46L8Jkdm5wRuvue1+Uk/7ZNFXfKq92F
 1KQcDzWUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImsamP4p7H4fkXu18t56z8c
 adxxm1E4zr1AfnG4wd/2AqE5QSc53BgZ3v5xkpX3++v7sVm00zNCfUboleDsyds5Pz77xbW9LpG
 fCQA=
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The Zynq-7000 QSPI controller sends at most 3 address bytes. spi-nor
> needs 4-byte addresses for a flash larger than 16 MiB, so on a board
> with a 32 MiB W25Q256 (the ADALM-PLUTO+ has one) the probe fails with
> -EINVAL and no mtd device appears.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>


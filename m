Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z077+vcQ;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=A4Y2b49y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jPHQU+9wXfFcupAO4vYQAzpuQPGZ9v1Qdy5LLuFL8Ww=; b=z077+vcQyXqyhf
	NFPIDFydoy2R8ODrGv3v8E0EmAMcQETgAiu2kA+lln+UjK13lcvr/KHNYy3YsI93K38I4zFM0JCvz
	Higz9GZOar6KWFtTDug5ytHVyIAw5YU0bLom/Tdy82d/s+MgPATTWBioCIwE+dlgD5awiPLHnAwEk
	s+Iz7grwAxKs4QmL7wFJU0WyzPJ+s42SHFT4xWU+PcIk4M9S2EIJhAJamw35YXX3uVszn+bfrTHbE
	DtEeKRUO2uFUH8+QzA7K8xwau9qM3FlHMkS/Y7QDVTRrdhDhwjLkyQOJojEB5R/cNMBo8Ja+WdofE
	R12vSVGrncq/lor7Staw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGe6-00000001stW-3657;
	Sun, 22 Nov 2026 23:06:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGe3-00000001st9-41UE;
	Sun, 22 Nov 2026 23:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jPHQU+9wXfFcupAO4vYQAzpuQPGZ9v1Qdy5LLuFL8Ww=; b=A4Y2b49yIgBkWlFP6buQZN01jp
	J84dV9WXuEMPn9lEjWR0wjYVK9hL/pkSMDVBM6uSB9Zvqt9WrdoDocm2A/J/uLoKuRvoxAVQlqoLr
	BQSVfFrM5e3/XvrqQ0EEJkGgQk4vbqwae0yZMEFDOoVOniVUwr7pOi07tn4OrsHVzohxqAsGXrWEE
	7MPkF92hkToFvDt/GvWdq451N4ryis4zLAM4S0o5ha6clmYl7TuolEckpxt8BlWulm7zmZpT4lwce
	44rUJiOUe4QTP+hH5EgJPE7PBIkOQuTQnAKxiiAN5lC56YesVfoq9ZLuJYfJ9ttewLbzErkzgml+8
	OYTATdhA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
Date: Sun, 22 Nov 2026 23:50:30 +0100
Message-ID: <179538782486.3150822.15627188420950858780.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030073638.164388-1-ylcncn@gmail.com>
References: <20261030073638.164388-1-ylcncn@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_150652_081081_6B41D1B6 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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


On Fri, 30 Oct 2026 10:36:38 +0300, Yalçın Can wrote:
> On rk3066a, uart0 (0x10124000) and uart1 (0x10126000) sit behind the
> AHB-to-APB bridge of the cpu bus, as on rk3188, but their pclk gates name
> pclk_cpu as parent. Nothing then holds hclk_ahb2apb (CLKGATE_CON4 bit 9),
> so it is switched off as unused at late init and both UARTs read back as
> all zeros: 8250 autoconfig reports PORT_UNKNOWN for uart0 and a serdev
> Bluetooth controller on it (brcm,bcm4330-bt) times out on every command.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
      commit: 5138b09d66f93e6e40503043412e8295142570b6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NloLCpIV;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qqWk7Dc+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PzNKVqZ5OSMCj0JtvQfkjphRxL+2UXHkcom4n4wmNjs=; b=NloLCpIVvBeBhNtAfCI4plVsaX
	44ox4kfj8LarfJB/Nq4fx7D1p8m84pyVqDQcG5nfDLDreuNcMKtFxUyoo9lWbhAIkES4GwAcoMa5K
	4AC6QLNNa0EtlLy6S/ab8CAp0UsklN0wV6LI62utSzXinOIMGxaoy41dUqLqs9HQawZV8zs8luezk
	Edxv2+mcFaFkLxdNO8btj5ClAYJ6unqFyhbm0qzPN8/N5qg3X+p7zEQNGqb7e1onhIuCfpX8b0i1E
	XwKMgtA/w7BJe1uD/Pr87UhygYZ5KXEydwe3w3yrFWt40mwXO4JjlDYS/DckKOmvdNbipXg1pqQR3
	6UNhDyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8Q-00000002i1y-3C0a;
	Mon, 16 Nov 2026 13:52:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8N-00000002i1V-2Uqr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:52:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0126DC4EFD7;
	Mon, 16 Nov 2026 13:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01F916023F;
	Mon, 16 Nov 2026 13:52:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD4BA11BC05D6;
	Mon, 16 Nov 2026 14:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837149; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=PzNKVqZ5OSMCj0JtvQfkjphRxL+2UXHkcom4n4wmNjs=;
	b=qqWk7Dc+NCbXtX2cq6rrDWJ26gmFzwSHh87Z9QsM4a/JNkbUmg/2zIboa5HKwzZ5yoZGZl
	IcThcIvMnAVov9bVo37RFCAP2KPdQ5/LcRHarUyxBV2muPMvG8hg6maZVZS7PpYLUdw7Xa
	9xkQvhWZe6mKVD3g21BNIFQp9lEBEnpX/6dZ4mU5f/nrsRENAl1zYVr2et+yJKTidrydk/
	XmjGNUP1jNj2nwejtDTLnIUtX4gamj0kTdfDSTLN92IHlOk0QZ+SLUdt1RXw/QQK1lY/Xv
	Cz4nU+G7IfbTtAMTRaKfVieUfGy+yJJO2GOoOl0sL9XyVb7cYaw5c+aXgCSZ2g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 0/2] ACPI: platform: ACPI 6.5 fixed clock support
Date: Mon, 16 Nov 2026 14:52:15 +0100
Message-ID: <20261116135217.37038-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055235_819008_6AF45142 
X-CRM114-Status: GOOD (  11.36  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rafael, Russell,

Here's the v3 of my patchset that adds partial support for ACPI 6.5
clock resources.

The ACPI patch itself is unchanged since v2, I just added the clock
patch originally sent as [1].

I originally thought that it was a good idea to send the ACPI patch and
the CLK patch separately, since they could go to different trees. 
However by sending them separately the context was completely lost;
Sashiko would complain in the ACPI patch about clk_get() not being able
to find the fixed clocks (which was addressed by the clocks patch), and
the clocks patch didn't provide the context of *why* it was needed.

Packing those two patches into one small patchset gives the proper
context to both patches. Then each maintainer can choose to pick their
own patch (or both can probably go through the ACPI tree).

Changelog:

v3:
- [1/2]: New patch

- [2/2]: No change

Best regards,
-Paul

[1]: https://lore.kernel.org/linux-arm-kernel/20261103084915.8405-1-paul.cercueil@bootlin.com/T/

Paul Cercueil (2):
  clkdev: Improve clock discovery with clk_find()
  ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources

 drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
 drivers/clk/clkdev.c         |  4 ++-
 2 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.47.3



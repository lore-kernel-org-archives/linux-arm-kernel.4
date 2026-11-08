Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51488606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pm8tMfJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VANkD8zB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7lzO5lTnNfmgMByl+cfN1fLaYWgS/5t+cBwb5xgHPS4=; b=2pm8tMfJzGfuqf
	DCbF2E9zSdmCIfPS9qbCqE3t94DITNIXkCei8puDcJkbIO8WXaSZqqmpwCFKLgXG+R+c0f78iEwxu
	THnSblPkmX8X21G2/G3ESlfcl87ui04+oeRHdMBdjEjAuRXBKLOVke38ySu9Ip9PiNa8uWn1OZN3E
	HrzzKJmDWIh53HCQW0qD0ZRty8BKjxpFbPJVIrA8gBkS+tZlvNh3q110QnILcR8t9mFVOFOcpxu8D
	9CfIze/z/kRuK4UQKwpmncHd85Hl5RDlsBferL0TcKtMGmk6Rtf1Vi/cu/JmkmYhBFwZA0sjvpIif
	rpXw6MKo09KmbfGKOQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5BF-0000000GM4D-0S5H;
	Sun, 08 Nov 2026 15:51:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Aq-0000000GLOn-2L9F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54AC343E80;
	Sun,  8 Nov 2026 15:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A34C1F0089F;
	Sun,  8 Nov 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153076;
	bh=7lzO5lTnNfmgMByl+cfN1fLaYWgS/5t+cBwb5xgHPS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VANkD8zBjo1LCoLV/V9BAEb3HaMg57Qj5LHwB/fOnSN8k6XyZ7y8ZZKaZBw3X1GY/
	 D11LlyN+CV+CAv602i7rqBIl68LMw6yRmF0U72ESiMthXilv/w5qkouZcVfjqPh4Ec
	 frdIserPpNnNsLcbYIeu+O9auBFNOHlhU3t4sgTdiAp6NFKiB+8V8XDtVt4jAsJx5Z
	 RQ5Y0CsB7XFRhbEawkqIIIIwGocAvaW5kR7FFI8x1UhZ7neK72AZDkf7b8B32FnO0m
	 jA3JlerUhl8bzfxh2oSXCrpZwkFngt3DmkH4ilOFchjrCo/QrvAXCdM/j/XJXwnDVn
	 ODcccO/GNtV1g==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:10 +0100
Subject: [PATCH v2 14/15] ARM: configs: u8500: Enable audio graph card2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-14-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the removed MOP500 machine-driver option with the generic
audio graph card2 used by the new Ux500 device tree descriptions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 15cf96e4fdcc..c43b2e39d295 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -190,6 +190,7 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_UX500=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 # CONFIG_HID_SUPPORT is not set
 CONFIG_USB_MUSB_HDRC=y
 CONFIG_USB_MUSB_UX500=y

-- 
2.56.0



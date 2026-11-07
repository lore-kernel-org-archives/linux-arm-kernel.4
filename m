Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nONfxpX7;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TT6lDaci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=; b=nONfxpX7ZyhT5SMFc+wM7silEx
	5zI7yCPJciFGUFSVj4AWZ7CI9UM2TIYslvHZ6edPsiLAVsjsB60+i3OOKZjLbxS5dB9YCpC5FvI4/
	63DytVIWeicJFQ08k/YJkbz4xb+QD0PMDEzpjP8nFYtxeEBL96iFbYLwbjL14xm0lj7la603ZMIEb
	5ZoCiU1/Cl0aY+V3agIg82QKbz5RuhgrWunb92eCStu19rPS5lbrrnsCDzY6TcczIiGkvVdw3hYTi
	uMxu+6dB85br3ygq/lzHkVRfTzoEgLH68jaW6QFr1ljtnejIDsea57cIEoDN3toZY/Port7vKMMX2
	g2t7SPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPU5I-0000000DuNV-2B4w;
	Sat, 07 Nov 2026 00:15:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPU5C-0000000DuMD-2GDc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 00:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
	b=TT6lDacixGosxWdcD2b50CLxI1afEyyBKYMASU0D8pTGnvD9DyrDE4BeK4DexzBRGnWH+l
	srnIzef60tmrrWmY0j1PKL/WDjothdhJQ+RpJs1ku9sGI97iuNSqZhJ/6+ybvmTh9Jl4vk
	cpA2r7AKJx+x1oIdhqy1jj79YWZ4xOk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-8XucF7HgOSi9cVd3tP2rbg-1; Fri, 06 Nov 2026 19:14:56 -0500
X-MC-Unique: 8XucF7HgOSi9cVd3tP2rbg-1
X-Mimecast-MFC-AGG-ID: 8XucF7HgOSi9cVd3tP2rbg_1794010496
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-544019b1831so23379031cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 16:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010496; x=1794615296;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cx9Rp6YTIeNtyaa0iGfIZ36b9vGqaRX5Tus/vFI1EQk=;
        b=BJKfedv0CTDci6kQ6zGhcVazJgRlwVUDmYGX+PTvoSDqL8r9IdwwMxQX6gRe5x042I
         ec0mzmiLD6AHWfwNu4NhBpgK4bTa5CxBAlFs1kIBwe1+AHJWCmaISsR4iftYSxx+LR+m
         X/nvH3jXotseeWTpbFHl7mXxItt+zIfuoucPqFBbWU9E4pfKDxwEb3nm48c5zpbfwlqv
         W2uBUw318Ddv9YaH8gytxZ+0/k/JC+jwgaWRh1UmRvoOhVTvuyI6v/piD6CGL21lv/nM
         M7nfz2hdovDmTqUEhKtW9Mj06/32FDlg4BEIlPT/lTkAJChbiCinZ9HP7pNojY2D9r28
         pbkg==
X-Forwarded-Encrypted: i=1; AKwUvBxLVNWIRsWwwFG2GwcmeuyAl69+CYB25ZIo/fncYSJET74z4G2ZJmwqJC/wsx3aV0YIsVJ7e5EUnzQZEhdcumIA@lists.infradead.org
X-Gm-Message-State: APuU4Z/7UzzXRzmxUWDge1fYTnV34vKFHKcCDgmxBC4XsOXo+10yP5xM
	dkl8YJKuj19VTHOhuAPtj6homw4atf04zYInYyCEDyh6dseOWRXO8TrLXfz/ftkW+ajXrpcAViG
	lHOeMc8jEYpcn6Flz+CcFeop42VDjfULxHIdg9nL3X59sKriRbyTFgM23qmRIkeHrdKemv+UzrV
	Y0+7KuaYbu
X-Gm-Gg: AYBFou3SgOZjyqKxCo/HNytnpK+wUeUEpm3ibb8gcKs2SaBiq+hDwRC+Imk78Bf1waB
	79+ckVDtlxbI83Q4IarZqtPr6Anjw6b+zU7PdC0HJS1LaUdlSJ4wGmiJnqIj9gKf60vyFE+A5vz
	zHk5fLj4MLlsdkawHu6FxGrnQnsSYCses4eY1GWPFfi6gai4ca2GMV0LN3pJML+MnNVQaFJoaUN
	C2KBCpasvt4MfpJkypXfFuoOPYglXDs6CLDTdZCb/ztu9nNovz53DrfZWQaiUxn6+T1+spTGpBJ
	HJkGhyC7j7gdFhc/Fz9A4LSxCf8vXYPS3NVvKhO7RS8dDzzjEbtfAPpg7wMUyiGS3qgOk4i9VKZ
	zu3J3p7l+eBmYr5SLSt+ExS/nqsXt9tSjhWI/5xzpzauvzPKt9EUrh8RidvoLjXWjyDfDZvucRl
	rsUqDLlCHp7Z4e+qj0
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73961191cf.28.1794010495478;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
X-Received: by 2002:a05:622a:138c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-54e138860femr73960931cf.28.1794010495047;
        Fri, 06 Nov 2026 16:14:55 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a591a4sm31938846d6.20.2026.11.06.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:14:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:14:21 -0500
Subject: [PATCH] mailbox: convert to subsys_platform_driver()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mailbox-subsys-v1-1-a0696237223d@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHNuyhLgVOWBnMPLXDiK5d4vDp
 77vvUDIMgnk3gWWdhaeJwfte2C6ampJMTpDGISJ1kGixoqHej6UbLWcojJEjKMUIyID7rRYavj
 4gkX52y17Mutbgft+ADFe+d9yAAAA
X-Change-ID: 20261106-mailbox-subsys-9ddd537d3eec
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3AfqlmxfhvtOFs2P8v1lkeNi768e0FuNou3yM1xZYxY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5Va/njKX4/zvh8ZCU29Zn++fUlxuaP7/8lR/lw+nt
 x5I/K/a11HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELD8x/FN2Dr8RvTypYk7L
 5G0vZQtW7Jh4dPsWLhmFiWsSK35ysSkw/E/vjD12wDx/od6djL7jvetjL7icSr0fsDtr9cdTRTX
 7S5gA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WowSVpqSBrjPHFB1TxXESnJOaRYKTovWDqBXKspYNuM_1794010496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_161458_690037_570DAF1C 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
 drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
 drivers/mailbox/zynqmp-ipi-mailbox.c    | 12 +-----------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 1f87a84e5995..f489bcabceff 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -243,18 +243,7 @@ static struct platform_driver slimpro_mbox_driver = {
 	},
 };
 
-static int __init slimpro_mbox_init(void)
-{
-	return platform_driver_register(&slimpro_mbox_driver);
-}
-
-static void __exit slimpro_mbox_exit(void)
-{
-	platform_driver_unregister(&slimpro_mbox_driver);
-}
-
-subsys_initcall(slimpro_mbox_init);
-module_exit(slimpro_mbox_exit);
+subsys_platform_driver(slimpro_mbox_driver);
 
 MODULE_DESCRIPTION("APM X-Gene SLIMpro Mailbox Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 96462ca84471..262832753fa5 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -875,18 +875,7 @@ static struct platform_driver cmdq_drv = {
 	}
 };
 
-static int __init cmdq_drv_init(void)
-{
-	return platform_driver_register(&cmdq_drv);
-}
-
-static void __exit cmdq_drv_exit(void)
-{
-	platform_driver_unregister(&cmdq_drv);
-}
-
-subsys_initcall(cmdq_drv_init);
-module_exit(cmdq_drv_exit);
+subsys_platform_driver(cmdq_drv);
 
 MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) Mailbox driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..f2a082f2dc7e 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -1023,17 +1023,7 @@ static struct platform_driver zynqmp_ipi_driver = {
 	},
 };
 
-static int __init zynqmp_ipi_init(void)
-{
-	return platform_driver_register(&zynqmp_ipi_driver);
-}
-subsys_initcall(zynqmp_ipi_init);
-
-static void __exit zynqmp_ipi_exit(void)
-{
-	platform_driver_unregister(&zynqmp_ipi_driver);
-}
-module_exit(zynqmp_ipi_exit);
+subsys_platform_driver(zynqmp_ipi_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Xilinx ZynqMP IPI Mailbox driver");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mailbox-subsys-9ddd537d3eec

Best regards,
--  
Brian Masney <bmasney@redhat.com>



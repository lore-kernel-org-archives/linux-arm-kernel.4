Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JCZx/LVh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UHvOAg06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=; b=JCZx/LVhSbcNbKtAnKheYmxKDx
	oyvX0o+6ZaS/D1z9b2L7ON40HnfZttyE+nYvEg/Rqsc7J9UDqD5i/iEO1gLZ/ktVI1AbscN+J4NBl
	zrmoz6B8J03tzOQGOK7EM6rSJiDZ8lAFEzpyqPCdWjX1aXi6FZSJpdxwn0pn8pHUJr6k05Dr02l17
	XVtvblNlqWVYHa5NCPoEF5iVWZvl919YTtqo9m+cu2jdWljJgjfFMzjdczdvlA+govX3c9xL6bPWj
	3dYDiHVGjp04FNNzlUYjvgBmjlQ0p1b+YCdCvAot0FssPdJeA67NefSp8Z6MumA5q7jqI0BKRPS72
	1+AEv7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tY-00000006YH1-0Vw2;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tP-00000006YBO-1xB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:32 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e00f3929bso1813236f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398009; x=1795002809; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=;
        b=UHvOAg06v3fZCMEQkDmnGwqPX7T4qZUwLeB0e//hqg342SofrWWO3+qc/EIxoivSnV
         HfdAAsZYMoYVtUbkAKu11PDg3E9TXJET9LiS1D8dkIH2UurDLpmHhsgKdKlILXuB2zmn
         1FjyBEh65yvJw7jNIGn+bk4lOpQ9raUr4bvtSZ8E3E+0XzDms6WBLytlcr5MVXuxKI3Z
         4aZukBYS2QJXnJcX3pSm8NbcbbtVtJsH9BrskEY0LP+oCiu2TZxqf4Rwq72qYkkWSr6g
         rptwT0AY+KlsmCOIXBzNF4+EwQWQxV1gbJypd4sdU5UMRioDyPLBlliE23y6B0KqFeCv
         3aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398009; x=1795002809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=;
        b=IMkwa3DHtNytELzUVSk3IA/O1HhDl6ROMa8Lb9qkCOh32kK2uu8vBJRym9rCKp5KyZ
         nsRHr5ErFO6Xbo06epPcKLyghAccyYcPern8FFZ5WwKyZUSD/4f2wpGqcBRo3bFgDzSa
         lRasnsg5ETg80cYgno2z5dRKjAHgWxTbMbCWBIoqicx89vmiV8jD8WbS+0tlhfMrZnqY
         rCTAUQTOrNAVfCZohUV2wQ0MYQnJwRHurH/U/UnFsTNJdS1JvxyZLCqvLogtSimvNkU4
         TikQmeqOM4PtHGGS532k6S0mij7yDArcBjCwVHWcxG4HL3xhb9//ncmq9RNwut6SqXgK
         bkWw==
X-Gm-Message-State: APuU4Z+/jiK6UAct3trY0RKFACG8/ASIyigfF1cSxSTpEx9aoK6Ol72o
	hKiStKL0aIMvgtt8Cl/v8CsQBmsNSQ9Za7lWCGoV2ErWcSgLAxTrXhhrWTm9pIeZ6KEt9ET7+Er
	LBP7gnT5+I8x4Zvm7p2iG3Ia80rEPFC1mjWeW9QuQtb8OWxbro/FPSpJpldUmqlHDoqLlFcwHCq
	uxYNKdDvOdN7lVmntgIujRYHyaL5thiPRnMASeViL/ImHV
X-Received: from wmxb8.prod.google.com ([2002:a05:600d:8448:b0:4a1:9c49:8b1d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b83:b0:49e:65f2:db64
 with SMTP id 5b1f17b1804b1-4ba0935bde1mr40606985e9.5.1794398008579; Wed, 11
 Nov 2026 03:53:28 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:05 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=ardb@kernel.org;
 h=from:subject; bh=eTbPg8U8qIh60PMGDcb39hGuBroyzjXdab1zxw0EvZw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuGLqD5mI/nNZv3+nvlI89PTcW7PjufKLUmZqT41NW
 b/91ZZLHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiWTcYGR6qWb5XDzUynVzy
 X/9FzmWtowbXJVedWXlrzbXkhd7vzCYzMlz9yLJp2vbH9fejPmy9Hsh1ddaiuV7VH0+vnZJ75kq pYhALAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-10-ardb+git@google.com>
Subject: [PATCH 1/7] arm64: dts: qcom: sdm845: Bump fastrpc shared DMA pool to
 32MB for 16k pages
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035331_524818_8707E23B 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The CMA driver wants memory pools whose base and size are aligned to the
PMD size, which is 32M when running with 16k pages. So increase the
shared DMA pool size from 16M to 32M and set its minimum alignment to
32M as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 844b840bc546..5f554f6b06f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -894,8 +894,8 @@ mdata_mem: mpss-metadata {
 		fastrpc_mem: fastrpc {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
-			alignment = <0x0 0x400000>;
-			size = <0x0 0x1000000>;
+			alignment = <0x0 0x2000000>;
+			size = <0x0 0x2000000>;
 			reusable;
 		};
 	};
-- 
2.56.0.611.g1030f0b940-goog



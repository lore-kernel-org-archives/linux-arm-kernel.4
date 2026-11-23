Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72111606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3/o0LdC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6oonl9a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=; b=X3/o0LdC++e7+u
	Xu+DKCsbdBsW08zObnY655ug9CPeInFHgjZKDtzRwgORwXnU3ymrB4AFoU7PYzN8Ts4QDWLqxlCy1
	XlJvba+CuYkAJL8IeN/YDvQy8GHv0IEcSzzMAeH62NJ7x89vxksIlAMftSbSDtJpAOgtPs74HPfMb
	vZcRCz/0SQn9VPMKJ8oeGJhBie+bUHo/9OlIe/Pics9tJa2v8+Pnk9AVicTVA96smwxGiOk+3DanI
	H6EpZrOVQ9gVswsQSKtQMpQl/zZ8GoNgamRqGFKhn0byFDyS4cI9ofdkpEPq2SUNZvD/UngU2SB3A
	mdr+0zNqw3F/dTW3Km5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPuB-00000002dOg-1wNI;
	Mon, 23 Nov 2026 09:00:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPtL-00000002d03-1I34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:59:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22927395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424334; x=1796029134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=X6oonl9asVTtiEt3shB70P3D0bNYG1Q95WXazOUaSqc10A5t+CL9P+LNXW6T6LJZnu
         qYfNHpvVCsOHGyllVqO9tO7fdkzFG/inym9kuAdKdJu/C95RKOcqoJ51tvNoJEeWqiLn
         2dLniJSRP4EYwKYQuZcH8S8Th5uUMZCN1Z23ohrqSRVt6tC3oJzvgqD43TGJBj72Ib27
         WDLgAkcwlf0Q3s6uUM4NPBGr5lX9BbxnQzrwm91exg1iuUiI9LAY3iha5t5s89VmSIw0
         W03ueB1WZup1LkCRY/v/I4MQVlKn7Wdkb33cJES0fzDvWfu2aCmBvs/otFwyqSEuwf2z
         kaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424334; x=1796029134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=pLE0etX7JeP46i4sharQ6EfliBDKt1Lt5Qb7HOji05UOCaCtSHL4Rqnv9944RWlFNR
         PLyZCTaouPh1iMasu5DAeqcK9pa5+JjxP0yHiknhiFTNlEkFYjCRtDYiXVHb9SrzLecj
         VK5cTrJhkEcxLp8zYK0E87LFE7UZvnifPhyRCIUqp0lhq/OZ1rgoUzktWrZn/yzMYNIl
         jsVCi89KIJYT7lZIL+uk2Bi6+wCVJYPvufa666QAMec8UABntmNX2mM+okm0xrxQVXFi
         z/Ne9lW0/P42nW5G5LtnPCgthTkB5EvG/eSpwW8C5zpU+Z+EScD45uFMdl0Gw/n0Nnlz
         TWEw==
X-Forwarded-Encrypted: i=1; AL+hErHivD4kzaedetOxqLdpkGct9yTFHUG93+qQis/wRH1hXC91M6SiYJ/axfPRGBmbFP6Pkh+VD4Ej74QT+uQe0tfF@lists.infradead.org
X-Gm-Message-State: APuU4Z+QAeMaEfqPMS3WaHltbP1bDuqber6E8QEFJMUoPKKRynylydF5
	m6FDKXZr2LL9zAyeFSQSjK2YftsB39cj37IgY4Yto9vXwCe3n5LWXE0f
X-Gm-Gg: AZFdTZfoBGe3b1hNktWqDQRx2cZbVWbqXymqPdbqqugUT+CFqPhenXTUYnpqucjP1Qu
	set5+EuOvd4YuWUIS0L8G2BIkVsy6HWIrz7Jp89B1eMq2JtGI7Lsa4HbQmzmOf+2jVJXYuPy3eY
	Dor3TeUddeJ9VGrdiSZ/oiNoabiG5DszY+57wHqVG/UdxqQoDMzz0qtsOS1SqcxKI/ivBBWwfrW
	iefC8dfQv2nsAC+zhfBJLCsF72nmyVgM4v4UpTqUMNiJt8FRlgVS4tospkZJew/wWJ61XXJqdUw
	1mwTU/jVRO+tO/CblGm8iuu+nuu1yQ9QGc8H8QEhcZaurjip1PfSJjL9FGaUHIah9Kx+H7yoZ3t
	vu/e1EsbV7IvzTjoY2Tmwqh/QwX7DIukRUTEtBaHm/b+KMJa6xjwDh9ua9dB0tWHS0S/Riqvm4L
	ANEg15T58e+9+shftB5ADNRlw6OdoSVcYuCGTbBKHaA8Mlmm3rmZZnIbFHjfmVl2zi2GdOVY6nn
	mOsZ/OURE0g51HzYjV9+PkLa69nbd+Oc0EI35ol2SGf1Q6ZiaiuZy8klMrY6riiT6us1wEqWGN7
	Nt0WiyIIXqF3mcjXh1WAWc56
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr234585905e9.20.1795424334315;
        Mon, 23 Nov 2026 00:58:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:53 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 23 Nov 2026 09:57:54 +0100
Message-ID: <20261123085840.8687-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085840.8687-1-l.scorcia@gmail.com>
References: <20261123085840.8687-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005915_459640_1B95BF81 
X-CRM114-Status: GOOD (  13.38  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch is resubmitted due to the un-ACK of the previous iteration by
DT maintainers, because of the addition of undocumented aliases in the
SoC dtsi changes. Those aliases have been removed in this iteration as
they are not necessary to drive the main display pipeline.

 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0



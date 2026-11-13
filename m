Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED3606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKCh3ap9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQCQqA0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=; b=QKCh3ap9DZusBy
	9uAMDTiUpyYDxDgEIfzZ7vQKPTxkqEQQ/ZsJwyXgcAHgkFTMXFdKQoFGaCPwFJ9/IgDtsb6cxsida
	Z8uUAYlgRS2A9R7j1fNoyYpC77/fLyjzVCmV6nOX/rMdRnBXSju/NTCUqmnctVZKvXEI9mCPLDuO+
	xfIK95VcmGCNnzP2CdK9zEf+wN3FVTmNzd+gZ4n2M/s3K/GPk1vecMWZRdZIS1ccBL+d4dJOA/tL+
	VGsH0rj0360tuU5DTVzXeVAQiyHUSFfW5b3uas7s7EZMpJ7SeosrqVBbPL9O8/qqvcOSnaP22WXF8
	WZif5iN8zhU5b+q941aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd1-0000000E5p5-2c4n;
	Fri, 13 Nov 2026 19:08:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcv-0000000E5hS-2X1p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c4697404c2bso227966766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596876; x=1795201676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=vHQCQqA0wi++SFm6Hpi/+ZQ5xzPxz60R4g1d21vkuECiCsDoPLlZJqyuq+8KXswsos
         DaQgexPH9I4JfMVj6FTOOQvqphJIhn/F8LfB49Cve1/RRMqyHANo9Oy8RfbScFuwLtXO
         qYfdQllzlXn+z6xaeLxtWR5eKIrOHIbDhg9N77hZhk5cSJx00fNsDazUzMiHkeH/GJeH
         Y4Xj1DyudHwwyqQ8h6nfQ93G8YP4KU7nB0HzNVXA2/ZT6cMrYv6xeHR4BuKiNWrj4/No
         u97hyY366fTK86kfYuxgcZZpxaoXwdI8Y4ll2nQfVvnSCbPcgugQsxv8ekGkEodSeDdY
         nmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596876; x=1795201676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=laWrU7AjXTF09OZm4iPOjtkidd6XLFZYlEmXUpMip+qzuBldZK04cFwtdgEOKcPlwU
         EyKnI4yqYlJA8xJqq9xKn+d6hGupDBoRwgHSVZrVA9la8X/8BFgQQp98mUae2yF7/SxA
         9Nlt7MtpkeBHtEq6v/ulXGPnY4L8MAnu5TOS81UsPcFfxdeg6KuopMwtWbaA9fzwD/bv
         vKSgyo/vNaCOfYZFDeGsc0RxfOt8919tIt3hgAbiLC/YmFgZVmrq8Cv/Bn5RRy2vzDRo
         3udPxKBETCWa/+c1rItMofvMLoTio7jnBTtay6iw0nx0HQSO0G3Sk7XYvIejVe4DxJoG
         NDzQ==
X-Forwarded-Encrypted: i=1; AL+hErEFf+A0ikcTUmNybAorqws6cfUrLjJPxFJTHQxw5eV9hxNzKqJANpmackyPEyarM49KFyff7IF1n3kqgXKdBW7h@lists.infradead.org
X-Gm-Message-State: APuU4Z+dRnU8Cy9RQlGBIMM8DIZX3gNMiA57IQSD31pE4wPOPJOq/qFO
	RVEbBRg6gu7ESwY1+bQMAxjBph39Yy/NjRTy5nC3TDVY9uMNY797xCby
X-Gm-Gg: AYBFou20Yu83KofUaBfwfgJofn7mRRzSiTCK6EK0tEqXMMQOZj/gc3l7HFE2pGLninH
	DvgaqgTdRNboeti+Ds2w+kHUt53jQpgMMgUAtjz90nyI53IoaKkLyi5p5/bJanLnsVnCJne+fak
	ukailKj0HA57SnMCGqE2MbMPoTETecNfUuyIbT9F8MUfjSYB+MVwpCSrpu5XZbU7TMr465qpXCW
	oFqnROCiURhGVw+Xn5axuhuNcyi2gsN21tyAPUkE8WTiSQr0DmBIq/1j5Lfne2KOotV7vV7XkZk
	JlzwNTzijfccB2SN605158/rP+iZMJUtJWkYy3KxyTzyGeKo5ZjnIhwlenVcFxUhCwp9KMx4RsU
	jfz1NTBUWufHvYGYGEsqPSf/YdhFDJ0kyQdjOX5HsLZlW9HOjT+akpXDLYmlQ+zFLJT+/xpGN9A
	VIm2inJnRpw1vzle9t8Mfa3JzJRdiUFSj6LWrCU0NV54vWUN93st7mSTRrhKfN6hVr3dKNk5fzj
	40GU7nnIBj5ar1nOKA21dPqoLb8bWDeajeLNjF0MSqRJRLBgRT1cARB/w5rzjL1V6NQhopKW6Nh
	u+yq1oeXa4KaJa7nEZANBgun7cnRIKj6Ms0cv05+QwR/5xEjiUo/cql+vOkDEpUE
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr336353966b.32.1794596875807;
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:01 +0300
Subject: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110757_670713_F104CD30 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -1.9 (-)
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

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0



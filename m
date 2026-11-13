Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875D60A262A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0SuFlwE2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7f1bETo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=; b=0SuFlwE2TCrquT
	P8mz2fUe1/3gjf8Xq2wMtfnBUnjnLXgPEhnJ7RqqKVw5scS92Jd9T/8XS754FqBSv4aq2vnQ8q8+X
	RaX2GlppNArF55irYhYtdY4lovpuEOFCi4ZvE0ZrsSE0EyhDRYoPJujZlh4k+DC4fyoAIx4BdEP9U
	HXVSC9YY30C74QW0Bkptx+CCvjWgTZZtM7f7AFjUOJR6sPoquObL163YhtspiB0qkDIw9yDsQJVc8
	YtnelxK8D2hgK7k5UC8FEVCVypyHYwlP/KSIOBa6rfapzz1DszoqOg/dc/ISBP9DCgttp7xdys5JL
	gOTg1qoLYjarnBraTOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcr-0000000E5co-0WV6;
	Fri, 13 Nov 2026 19:07:53 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwck-0000000E5WF-06Vk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso226811866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596864; x=1795201664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=b7f1bEToNvitVQ9iAroFBKsSh9U30TmoFe2YTTrCp6wIRM5N3gJ+Kxp138ndu5AiiW
         HIEvNvi4cZ7dn/uegt+dSHYEWWKckoGW8CGLYFY2umI4uKHXs9jxMyZSPdpW3SIZ4yF5
         zynkh5uWIuScvklTPH7xni7Wc/55swNyokniOeZ7g/KEEkKkBXTGLvV0qZARvCgIk5tI
         SLvFoT69aZrdeBORtL9/qdV5P2WH2PLO1Yee3XaEXHf1ax+KAfzGhOtfGg9imUeWcCM6
         wRPiwNRfFM/KHIv8CRdbtjK1kLA6o996XLgTr3Izowpp34WR/LfopA9vRlBqpy/iAGO4
         oyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596864; x=1795201664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=RjeZArIuty8HEd1Cj1K9bBulkauk5Vn5dUK1LUwVEQMRqGdf75XEp66trCpXc1iOrj
         khHNwRsK39q9H1YfwykQo5D6LVvF5IjLLmtYAlrtYKj2g+dRx2q4LFDCYeoPAN6hLGlg
         132G7UQP6ESpwS0zL95w11WDJnVTtt5c2XS4mxBiQtMfmAGJTrdcZplMyS2kKCf/GvJ3
         ++9j4Zz2DP9o2FWGnPCyHkVb8YTUqs0iAy5ApM71qyjo22JeNQN16Lk9ODt9wuDLVhyU
         REi+5W/ZAespW9HjoAJRAIgUP/1QsMJUgX55/8EKcGn8AodOLnGrzZ9XS93bzMm41ph4
         YqVg==
X-Forwarded-Encrypted: i=1; AL+hErGUGttZxpCu+ISl+nrAqwd6R7s5lOfFi29bJyayv+0qPYoTaU828lg7OXSVgk08tLeysI2B/RHAUW13hR1572mS@lists.infradead.org
X-Gm-Message-State: APuU4Z/u55zQdCpLke7G61TL9YGQSnl9YErk54zpMLSSZXkPk32d4SEW
	5XjNfVjyBjSHtE/scYg/efO04/7uFvlXrNIG8J7fxqAB4Q5KkP3SAA6A
X-Gm-Gg: AYBFou3L5Xv2Nhlb5hvG6lWRhJDY5dXb++9rgDhcfxkUI7aq2JDjIw6OXJv/LxZrZ7i
	nGeLyVxW7m2scR/pdvYoievFIcGoPqhS8F+TnYHcanXkI84LnYxaz3Hya2yGd51HRQ+Ys1BhkUU
	lzznW57PUiSB9xnMpDpz8gwDi0rmQtl1HXKxOfRoFO252yo8dma0CQLJUOkuayy+Ml3M3Yx3qj9
	ny0DUPM8OLtZBLM7ELSpTBWm/LSC1ae3jL2yfc2A/Q3gnV2v6C332v8Vb15GuSNHLp/Ma38FbU/
	/sv26o5JEa14UtLNYjK0c7JxVPOcvopV3sl7KckQ7U9mZ70mQonLiEDwdaxYe4QQgi8STo+fmWA
	X1bM1O3Ym0ELRsSOwoelYkuS8+Pn6cULf7Ca6VGz4uMNn0VLtFGyKBDH/Xtpg5c9/iP3l0BBYYW
	7VkQdkgNtPmwGIfwYH16vqj7r0nZM8T0cBR30P9Xt+1uaHzh7VxLJwOLoNFbRKkMNqJch/YSu0l
	I5RO7BHcOIcOztoVL1vQWJswoHmVVUJRCdHCWRYHdsZZcQdfqcjCMW1b+BuXsGb9aWFqReTZ97d
	eS/g97zZbQrzxIg3Dt/mNahYYvpDNhTvvzdiwqdekxu+dx5HZ9guNr0ef352Jrjc
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr310340266b.16.1794596864130;
        Fri, 13 Nov 2026 11:07:44 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:57 +0300
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-1-4ab0aa9fa391@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110746_113483_83CEB8D2 
X-CRM114-Status: GOOD (  10.72  )
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

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF51606A6B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dGAxTJrv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amG73RkK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=; b=dGAxTJrvtvUZQy
	ObrUYdOwJbq65LPq4Bt3Dl2kSb4puQmI8kfqMN+v3GVX8QjIZ1LLF8NXvYKElnrHMUivqnoGqoGgl
	6OjG1okthCjwrWGVBm16IhZoE6CD2Bo8AAo44POCEy5j6Q9GHeti7sg4RV+l/AWPb7EvsaCTLj4Rh
	p1m9wDFEVQ1c6+qYaCZSSF534Lgxxv1hcRzjXVnuCgQO6afoWmmJwYdChHV3exCIDJkqdk6nQDuGp
	X2MtAyz8/vXi2+RQ+O3aCsTAxon1fKMfh1CDj96NCzxCzm+ybArSlzw+51uAbSSGC/5zhCcR/BRaO
	6WOIUzTdzLpHyYy5me4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbz7-0000000GjNh-3NIh;
	Sat, 21 Nov 2026 03:41:55 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbyt-0000000GjKZ-2LSQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 03:41:41 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15dd124bbe7so3483084c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232499; x=1795837299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=amG73RkKoJPIFHveVWnRbywm81IFABDhkt7uY4Huy3IVEfBwmP0avBY2PDaPdgKae0
         QQjB4tklCrzzVR9gb4NoXHosb8ToMzbqz/CEeZ0SSOCzFGkZzNSIKIdCWxumw17eFu/R
         hi8UQ89J19xJadrV0HcJRrzUDOKsZtmiteC1npzmNYG0d+uHgjHXZ/RtnKb4mc4+d69E
         5sgmsBDINV4FDEfPssy7C+QtZT9OJJNiDo/r5TtnHzoOv2PU3B91aD+53pPkwRzFEUc7
         x42umwmTMSBnS1NGrRvoGwftHAVES03MyCPUqCRGutHIExQR4y0Al4DFcIzOT0ubVwWc
         sPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232499; x=1795837299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=HfoXKGqIqGSjVJFDORIloT/cTP7mTlOFMxTPdZ/qHBjg37fXloiLDCYUY6jUatul7L
         3tiR/c9qddEbilGbRVJMxoTLCi9toH1lFWBFzpirVUZMRFLlPHP9FKTz1zNmSZb7iuwe
         0OLCZH5IoPRHT6pdiTTfYM2qc6ky1zZp/9FTTKdAtJXT4o4u0R/BvxFy2YWgk1v+tzef
         BB98rI+Y1O91Bd8iPAi+ZRmHLe8Wuq9Xtbtx3oahjBp2ZE9NFTUrlRWQXZhVV3Hjg/Kg
         l8fD7TKjtSQ3ngOKPSYYho+qHD7xmxU2YgCLHSu/ZZTJi/TBSRL657+Tqx7+cYUBuRQV
         wuyg==
X-Forwarded-Encrypted: i=1; AL+hErF6yG447vo/3AxV+tSF/I+nbmvpVRrDOch9abEiWJMmkACTEpg1TtuBHsVl2Wlvc+SeSTCKNGzLqDQIC4fa2g8u@lists.infradead.org
X-Gm-Message-State: APuU4Z/8XcHmTp5TJeqqfAhQxImIynLA1WbJfaEXgP0CP2Krnm8X+DSt
	ulw5amjecj5Gz5lBTrmUA27zWF5pPdW6iiDnP6vKZqfvhh5v1yJUHN5O
X-Gm-Gg: AZFdTZeiAeFGRW9pzU04WTdyky4EfcyYVzT+9ysK/FbZwCKabr706itO8TUwZhjB+CD
	Kp+8UtcE5vHdBz6E3sGqmO5atEqPlqjksRkuPAX8g8TY2Fs85rAnKqWPjxNSbRa/zLgRyRiv17h
	MLzxm/OW/F2Iw//XBwmO2nnLHYUpxWdst1st5da+fbsNgLAlLJevqSBIi2aOuO4e2BDEx5p88Cv
	+hc9WU1v1Yjx0oyqerazWf4BFdvzmMCZL8B76HykqLqVkS7dAzdTWklMns8Zr3qLxBWMxVrizk5
	NlEU2Jq6Fn+jsdF3D2eknxVxMnf/Pt1pQH0xIh6LSY95Nj8FB/1LVm5aKr5C18//TgGKs5nibBn
	T8T9lcFuoR3xDPcSk8w108DnXGcEV7T5haHcC7IhXzSeoHl+ddB7Vui3m5dhtCOvqYHgPs512F8
	xI1iKRoybKqAvwwpAFLJsDz6bftdOePYDuMfVvMV3Z/dkr/pRmzIbQj4nSEHLtAQ8frwco0sYvI
	zsITgqErI5rbDu+ciGFkVHPJhoblEM42HJS2PU8uwq7CWCHqlZyypB0nKV9mRGHfWAe8RM7Gw33
	4IkIk6bUujbDpRXVF+eqsLWeahj2MiCI/PP8f9/dR5mkZw==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr5305042eec.23.1795232498643;
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Sat, 21 Nov 2026 09:10:52 +0530
Message-ID: <20261121034053.39878-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_194139_924234_536EEA4B 
X-CRM114-Status: GOOD (  11.66  )
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

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Cell offsets address OTP data rather than controller registers.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

---
Validation: dt-doc-validate and the selected dt_binding_check target passed.
The binding target used dtschema 2026.4 with a local diagnostic lookup fix
for trailing # in schema IDs. No validation rules were disabled. Two
unrelated TI type diagnostics remain; no SBC diagnostics were emitted.
The valid example passed, and an unknown-property negative control failed
as expected.

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cac..d8e19c2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };
-- 
2.47.3



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF2F606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wUmvSsXc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qRReHgBD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N4J77umm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=; b=wUmvSsXcMr1lSJ
	Yk5nYZmYO6aKI8Dd9491WtgUJJYXxD0aybEt6e8+YIwFQHtzJ1cYGjaJF/X0SQ2qZC4TXV7DD/X5n
	PM/GMyKAJnttMCj8IhGVd85F4JAlhudkG8Cg8Ho94i/lh9Zba+ZSpRvn6ia3Ap8uRHTk+AbuTnANb
	u0DQyQ3fNDLJRKHqE9cnQOnJ6XIKcoPKtso13DU2h0YrRcjWijQ2w1rRSTt+Q5JLZwf6ZVL4sh3oF
	phKMKethZc13y2DRKtgcExVJ3u8PEjuSlOs6clG2YvHhyaS0PyfR2hkOFOeGYCVB3FixWXEmmyhUz
	UR60DVeXYvI1KsX4rlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGv-0000000EZzw-1C2v;
	Thu, 26 Nov 2026 21:44:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGu-0000000EZzM-2vns
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=; b=qRReHgBDaH/BHLBLtU0Y8aXixA
	4eXAG1rbYy0f8gISluL4841wH5L2GnX5WsmNibS3zCcX5wWmGla8cgSkpcvECFrRmYagKtKPKBTpz
	X9ukosw5N0GHZhCVORdkplYkTS5KR+fI4/T0Pbs8RLdtEATQjkJnMWKGtDZTxgE2/m5GX5pm0Qr3p
	0xddZd57WgXsL3KQh8s5xZKLfJtcV7pXzkb57UK6V2AeWsZAO//KqT7u9YzJO1IMo+Y7sMPe3yxpD
	kuFNRJkNwIf28VnSDuqjs1ExImDcNOIu3v6W1F4TovyXWfqgaYdI1JQAju6dvH8E1QdLMY78QpPlZ
	i7wP68SA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGq-000000074dN-0MAf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:44:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so6744215f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729480; x=1796334280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=N4J77ummrJUCL787XzpFOzwXnBBd76PdnRjE8mGCIOqcsGTCHTVx4wqLIi8Wr7os2/
         De80SkJyTVmp3gBAfeMFOj4JnQbton/ZW0H+/62I840QuJYj2DE9YKdKktaAKlOUvAZR
         Gr6ixVTkbRBpXZGKueYCVSUHQGwq5LisDIak/IuyEmJRB9Raw9VyZHocRIrIidmiAZOH
         qVQK9/KanPVzynQ+UuBjhL0jBslR6olm5wK24UO7/Vi0qyf3rjvEjY2L43CC8wbMPNjn
         OQhghUmuK6uY3Xu8vctShh1e+9/82Hlx0FDAtRYYqK+M1wFPiyd+3htrvD1FT05IFt9C
         6l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729480; x=1796334280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=rBVGRSTzVOekKGepJdsL75yfIAki33BdEXYZpeJozvAbgaOGSaBfOiW/Tucmu2mHoJ
         s0auLR51ZaPS3A12Zwzsu641QZDOB/zxzvp5nkv2bI9k1m/83nJO7D4udhpy8Pf+vIEo
         IGAVjeOLVHmgsNTCGu+GgRFLY6EP4FHYzolG7suOpwkwVhmX9yI9uTlpcdnuEs8BWXHC
         /1N5YG3kUp5DqalAQmIfvlrvpKoxBEZBP0CUUdooGp4Iuw6Hyb+ZKoKOoZkguxJZOvZ6
         cwlEG+ENlafpXQwqppsiamIClEObW7OuAJ88NquWILddUQcGhtK++s0v0zl+EHUpsusS
         DhmA==
X-Forwarded-Encrypted: i=1; AL+hErEAcq9gGDoF8yhicmIsrRwKofTB7whnSBDHZ4lD1IFK/Udx2QhZBXieaggZ4TaGyfSt5DgykYNgKCpXUCNXyG50@lists.infradead.org
X-Gm-Message-State: APuU4Z+WkQwQdD0nlXDXbDCAezTaVma8Trd7T1n/BjGJiHaqj3H8YPDY
	05GtSB1QqpTIp+K303TB05C+r43sNdbWcg7eikhQErkwgJqKdptALYJo
X-Gm-Gg: AZFdTZedgeM3Ki14pIx1sVMOkJ00Np8LVXQTylYG6hXB4I+sq8HO7VRaQQE1xTr7ntt
	BTOyhS6nDDPbQvtEkWTyAMl/oduzwf/ceT2vu18ikLNJXesyiQ5zjL5YBuZ/2+4dr4XGORuKm1Q
	tHMMT0KAQ5c2bQv1ADjEUPB2YsZHlJlJYgaKLdOirrbOCshMEEH4/25W2+JirBduA6TUmCPVzfk
	o6Tx9iZNYutNynezUKCWBXEgKNWb9htuAgaRDYCFe1l+gpVoHYPBkdGspJdqPtB7CPGiKCKqqeJ
	kh9s3TQkFPJEPuxg9Iu0LDwLjORgeWnGLAMpLqlfMe5HLWpBYICbiUYhRml/pNZ/BOIZ57j5VC1
	8To5qWT5oJJk1j6LE6s7pMa7DM7CJG4Qfm0YrPQqZpHIK8jtyvei4OHyRPiZAlKVl/78eVzy99z
	q/JCPqbM+ieYf7YPdm6kmBdYcCgBzvos+LnhOhDhDxX5QTKl5rqJxr/ivVYs9WhZi8vHWMSqEq3
	fwynZfE3JChboo4BkgVeB21KCyTHKWM1iY9T0UQlUyHhlf9D7HPTAAN5gil1eCavlcChBXwhyPz
	qSF3OPQnLloy0PcbJY5BxpkUDPqj5jJiqgTzE2b6PnMavX3gOGkP+d9C1GBI35w6R+9pSPAoo0u
	BWYbItkzFojNsiRDWDZElJ11C58L/+7nlYLU5rsrplz7tHXD9jXvp+bJJSvecWt5gYIe1tCIJx0
	0J0ypubBO7DFucqsTTeQpqxdoW9ux8SjKzDPOaeydFam8YyTnGnQYMIWElW8ZkJwsBzhljvY6Pu
	WHLy0m7CzHFMSpsot5WTJnQQaUlgyWwwYkpvwJJA14=
X-Received: by 2002:a05:6000:2997:20b0:4aa:d196:f325 with SMTP id ffacd0b85a97d-4abb7f2ee9dmr30913744f8f.40.1795729479959;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
Date: Thu, 26 Nov 2026 22:44:23 +0100
Message-ID: <20261126214433.3562326-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214449_289923_56299BE3 
X-CRM114-Status: GOOD (  11.35  )
X-Spam-Score: -0.2 (/)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

R40 TCON LCD is similar to the A83T one: it has a TCON clock, which it
also provides as pixel clock, and separate LCD and LVDS resets.

Add a compatible for it. H616 TCON LCD is compatible with it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..05ed4ddcff3a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -231,6 +232,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +282,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +300,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kdu2gdiJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XadkfbRH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=; b=kdu2gdiJWcUafi
	9h1EY0TwDNHljMexgd20cd3cHHOjxmUY5nMLtD1B1yw3VlM7IefAoLpDF8a+RYAIH0+2yMWx2Lgia
	1GKfqNcSDnEEo9SYg3Gk8pn5renNLGjyIoB6+I46qrLB5mv/f1EgUZ7W1E14+VLIdCjJK2kyQuBIv
	agMfwclNsOW01Q3UIWZZohAJqYhvOo/up465Q+nJNeZ/sWXZqMAw309NxO+YECS8tzveqqzKwKYaV
	ckUqPl7CcaY+18fCBvSMtSdzFyHIWZpM84KiGkqsq5TdVViF1VZNIF5htybMQo6WxcKkFbEezoe4C
	9cVueGdh72mA8YsOPEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqTQ-00000004mA2-3idP;
	Tue, 10 Nov 2026 18:21:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqTL-00000004m8Q-0SMr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:21:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso16419335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334889; x=1794939689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=XadkfbRHeNS3uDFm/arzae5ZzRk7nbrV2fkt1vBnHpndzJ/LPiWv2ZIs7AoX8eQfOf
         czTpdW72nC8d4/JOSdvjdusj3xDQtx5yOFjjd4Mn8hpbpWMM/G9vMJpfhmofj5zb2c5Q
         Wq6Y2Pn9HSDqi0osfuKv+CrWJJ51rvT7oO/2fCm9Ye/eyaIi3gE63DMyaXOb/uSQ1jQX
         4UZ5kFxKF2EAaTzb5Dru4+bT0tX1Wm9g6gt0P26ks5chPzfRvGX2TXORmogxCTDFQEOC
         hNXbN16z/RPCdZF8b/nNQSSm7+gh0R59Aeb3PrHRgufW2TBh9Omxe3RHiNFNhbzu19Lr
         u0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334889; x=1794939689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=GLR0UoCmJk+SA5jY03+GE/qZWJ9SUttdbUO7XQyoaf/rndRVoOjxRluve5zdTu+byH
         gUdpbPSiYHwuIqC5S/Mca3a3p9kU1khhrq3TXJNWHOeE5xSmIWkdfiYQIdq8ehZRbdCb
         EyJu4p+7yJ44P3Hfwq32j4jfXwMWa4LHMyooupr2IDOoSyi9FP2SDe9P46vFZy1X16ib
         4ZFCx2B6dhhaH//WCh6Zh0USD2CJ78cfiM+aBYE2Bj75uA0Ie4gTpfkU5B6c8XQuQ0C3
         mjhf5j12mkoOecQ7vPR2146JY/wp4eYymAhix78Of/ODOLwKotRAZ9BBNdKwX0/ZDvr6
         OA/Q==
X-Forwarded-Encrypted: i=1; AL+hErHNfco0tjbftyCf1rNk7Loy21l5GUv9urm5Zll4iBMH+MZOiNPwqIG1cqmxTytVQ1QzoRYDcFH8WC+rcGpdDmCp@lists.infradead.org
X-Gm-Message-State: APuU4Z8DDJaaXQjDkpiAGAbn6S/UliFzy/LlgQt9PjmdgD0MckTfci9H
	riCo8BOHIwBZfiwNgpWMmRnlLWRrd7yQZ6wcKK197Z2AVFgufeFelRjU
X-Gm-Gg: AYBFou3Q5mYMnq9SbedXDNrgwz9tmP5KKlrf3uyxNf88o+3V/WHaNkOnB7NgcTtMd+9
	mt4ZWK2YfHyBOwhi/fP6g5HaL54nRJ+viQa7Tzki2lhYzln4HU/Su+jk5Oj6socyzGTYQKSk6SG
	WV1E0kbhvM7jPoFnh+npezrk5pGM6ZsoLVf7qXDxcEn6H3z5egmngihJ3Xu3md69r6F4w9GRTnD
	TrK+Ftu1+gKYq7rEx3Q4NS31Vlvv4UvmHU6yKOExgbaFtDZZ4GN0UiAvN12SxLane2Xl9rKTB3Q
	MB+GPAAiohAodZ3qiYp91/QhxNKO9hsamedre9Sy6bMfrmAGLUc1OjkWNVzWdvT1gH//Ry7t7Gq
	FtkmCds2CIZi6vAvWp5gcMl9Xae3z6HbjmbNdLxWnMcvNr3uk796Zw1VS1f8BP/b3thQ4IqVr10
	syMKFRYMLprPSkMdvPr6+5VIppcir/wt9yZIPRgmcP9t2jseAqUcX+BccIuetBCUZE0uArdDH1J
	gV2RUa5WRS/eUwbh0cWS3v8xpdAfTQladE1hLb3eeqqdwkRzI8sBA9yDs0W+/IKqQL6D9ySl2Z6
	Oc8/Pqb8UkZALZZOiVQv3t7fl/1dAUltKcM9487fTU1LwOwinlqa0a8uYJG87dWtJQJtb0Ci9H0
	AYdd13VZI/0DaO/L4bBcieyuCxsg5Us0e5CC8coJ+mUd7kgWYte+cByg=
X-Received: by 2002:a05:600c:4505:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0234e282mr61882635e9.25.1794334889412;
        Tue, 10 Nov 2026 10:21:29 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:28 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Tue, 10 Nov 2026 19:18:11 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_102131_164592_0BD24C74 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3



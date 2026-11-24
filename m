Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A36606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D2UKK8Ef;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdBoy9Dp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=; b=D2UKK8Efhp/EgH
	Li4HWLXD1LkBpaGnkokxskzVMXtLOg34DOPws+CBL+7uh3ZXbsuQmTCK/lU6d82qCqBhzC8L5Vbsc
	Jiy8rsbkhMcUvqIbM9SfG6JS3OKqnZLuT6BJAbVkFMcwmYHDsMyG2JgKcN4HYNEcrp+ZXv8hBn3kG
	ohB1gS/azJVOnlRq+osqgmjtw2SwY9CwcknhtPynPoVpTytkeimWUFIt/7MUQvHMiLaDw1MiZQkwW
	FQzV18mr6tSYj+ztVBat48BHgNtfvN+ExX4CpwAZkuDonMQY3Tdhzt5eR+QSK4/ZUQaPJK+vCPDOG
	225MOhHsWX4PEegp6ZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx29-00000007iIC-1AJV;
	Tue, 24 Nov 2026 20:22:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx24-00000007iGO-0zuQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:22:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2932476f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551746; x=1796156546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=;
        b=JdBoy9Dp8Ga2xjxGwmDoPTGwQWL0qCO9uE3VwjPn2RK53wsKHZ/BP/UTjU/wep5VWd
         Rkif4ZKzArEbJLhIep2YtwHSGzGVubjPe1WFA6MYwK2RCaZ5ojMU+Eaw6M+ACOKR0MPQ
         1Fwz8lJ86mr6bt1LzxZjz5Ht4DZux6Sjrto7h59TIicsH7fGE8gfCrpQbI9BYdZ+Kwtr
         0WpNM35fr4cxUmHV1SuK0efekSwXCnTDSxMRCZiVqkqPuBllqysUKQCO8dCYnEJpA7/c
         DNrTfmhRu12zhPdmjGoYGRNCENmoDSXSlKhn9oQYGol8Ay937htauq88+lxQhzKp7TXq
         KoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551746; x=1796156546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e9UoPHz2Rclxvw+oydXmBdhJXKaRdS1Zd9q7gn1BEQ=;
        b=EhY9iNE6eTJ+AkyGVh114wsfeVyqd6NTThriTpCa1O3HxG0LIXF9r1goip8oDs+B0P
         yYaAVHZX9XO2TYNnJd13tf6ufvdlsH4NgS4cH5/GXvwH9SjZM3rrZElV47Edrjrj9dvf
         +HeilMcTFdZ0RTPsVUF/55qlzmbHcdWEiRPBMTImRFdKMwkiDPbmC287LfL0l7dF+nHQ
         qqhWDlh+8zKFRUF29UAjhg753qGmOXa4DVj1WNe4mh14UaoH9VJyv0CwWK8JBfdrHMGg
         f3RvjWqn1DicgV5N1WPG6yDV0jtRQBgRgQ2vCyRjDDqlsneBn6OB/rQvD5vc3jRx1wgw
         ij/A==
X-Forwarded-Encrypted: i=1; AL+hErHDVyGq22NtbbJVpncOSNxuk5QJ2zBt02rTK7C1jCUkjcUD1uRGMD6rsryitoafbuMu2rfXHXi1ln5nYdTxm5S9@lists.infradead.org
X-Gm-Message-State: APuU4Z+JpnlAMhvLMKKWNH00qax21SZRwllG7wI4PMXlKQK0O8sF2Z39
	9/Qu39segDeymZmgkiXMpShsLfrxYkgmUCT7p/TGdPcelVfDxUxIsgUg8wIcFkJBLGNLdpUQjKM
	i6X0fnSkVrA==
X-Gm-Gg: AZFdTZf4/LPeQL5V41ZZs1C87pWKJzwjB4ixe3LFwfEDdiQHTXxsMKq8PdwzFAG5t2h
	nQDEsgMHIsHeAUXTcJRaGATcWbqEN5mCMNq4H58m8s919bHOfol6jxBjKuKvqZCbXLp+UWtC5T/
	Rvogkk7eCFTMj0JOmkE7WzBht5p0MGlv5XyXqgb62bR6pSV8YHyKF7Nw+NtZEr1o1r2cjHz7qaR
	2uQpUFTt5gOS7BXXp8Y73QqQNw6MLjU9ZVNRhPT1fHYSBaDbThYAQ/5ADzW3zuR2f38PqINlkMF
	Lylk/32KHGT5RU7OqjCqMNM8Age8c1fKiKQp3vVYLM01p7Q13dOr7zX5O5Gl5Ki+WNHRi0gJqRH
	8+BOp/JFjpShSdzB2jAqDiVkS24nJ9IT73CowY6Kbda0L3oY0GdRnWGFtI7J2N4J8Qmfn8WlYQT
	s+IZ78lXxHmK5pP2c+RgZtF+TwVUU7fOycsIclzb3aOeLbgJKvirgyD+KP/hhQSIq2JB3S1JrQW
	KGASMrv673m3ft0DAosIF9Lg3UEtKRYsFeMvgRahf70qXLfkaQHW8x9d5h3XJInNrmLF2PYz5/1
	40/9nxQRwSZESGH8WnQLyZH28gFHhjBV3WiJUfe2AYejOoWwUJTKHf9kxsmRNi5F/ssJ+aVhcrc
	bwM9Au5+SziE=
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr23117524f8f.29.1795551746271;
        Tue, 24 Nov 2026 12:22:26 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:26 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: st,stm32-adc: add temperature sensor calibration cells
Date: Tue, 24 Nov 2026 21:22:19 +0100
Message-ID: <20261124202220.23721-2-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124202220.23721-1-gerard@teslabs.com>
References: <20261124202220.23721-1-gerard@teslabs.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_122229_565614_75FC7319 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The internal temperature sensor of STM32 ADCs is calibrated in the
factory at two temperatures, and its calibration data (TS_CAL1 and
TS_CAL2) is stored in a read-only area, along with the internal voltage
reference calibration (VREFINT_CAL). On STM32H7, the temperature sensor
is connected to ADC3.

Only the vrefint calibration can be passed to an ADC today. Allow the
two temperature sensor calibration points to be passed as nvmem cells as
well, so the ADC the temperature sensor is connected to can convert its
readings.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 .../devicetree/bindings/iio/adc/st,stm32-adc.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index c4c4575d3fa9..9fe41b89982e 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -337,12 +337,22 @@ patternProperties:
         deprecated: true
 
       nvmem-cells:
+        minItems: 1
         items:
           - description: Phandle to the calibration vrefint data provided by otp
+          - description:
+              Temperature sensor calibration data at the first calibration
+              temperature (TS_CAL1)
+          - description:
+              Temperature sensor calibration data at the second calibration
+              temperature (TS_CAL2)
 
       nvmem-cell-names:
+        minItems: 1
         items:
           - const: vrefint
+          - const: ts-cal1
+          - const: ts-cal2
 
     patternProperties:
       "^channel@([0-9]|1[0-9])$":
-- 
2.45.2



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32369606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4hJxdWf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTEbP0Jm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=; b=X4hJxdWf9OP+dQ
	2IIdyF7FBA+bhQXa1tLbkK3/M/e075OShrpUYq+bg06vpnWk0LeAo5Jt4GP1IQOO7rJJmf0Djq5Z0
	h3LTSkFAUBijUw7mguWTCf7flT4gp5N4xxERn7MWO/0pDS5dfF+pfu5TjmbdNrqTNLdIHAaUYs3No
	jkAcbg70ZzFCDPFUwoJljvLSqQVnE6n6YVEGn70gyT12FFBUUggBYD1xeE7rVS2MzGER1hd+lNEhy
	aOjU8TovSDL+t2e3Q8IuFhJnmt5SyPBRJZf/YTV3L1Nx9GSs3pX1gyZIcJXX43O4KSDfJ9sURTtMO
	cHWilDxNIzvR02iB3Pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoi-0000000FHsN-3V6Q;
	Fri, 20 Nov 2026 14:42:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPof-0000000FHpG-1Q6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so907184a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185736; x=1795790536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=DTEbP0JmcOdFjq91IbKNm7z0HISjY8KnB7preyMT/6UzCU2QnoUT3PDsyaRuB9Q634
         EZoOpnf6oz5kcRfvo5h3gbpsRgR8/H0RJ90fYRrFVBz01hVF9ov1TG1Qege1Ms5kzkYT
         DIcwqR4aKyqy+owNXCqzGZNu3JGzL/3nRDAFgLReMu7/vWl/59Eaj+q/qcB8zyOUcGv6
         L6zLpmnj5NhXR5KWF+QBDFqFEGjE+LwwSJ23t9vsXUC1tsHP+Qri24S2o80m4nR4JV+4
         TNkR9nS/LA0yJFvlZxpGumrnhhewVTqMNw48JFsdf/sq2Jpp40kfrcKHwc5LW14Th5Ky
         X68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185736; x=1795790536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=KdMcPV0lz/WU4TOQ2iY2yZF/Rgd8FfVcAJDLMZqKPVge957SZjdJ0tdSfD/63Ajq6x
         SuBnOtNi4a7gLO6BO2MjEQ6XK2UKsAIF9ey55XsGuYJyJCdVZV2sahKAa5xygg7isHxE
         1bbdPdWP96FiYPsJUDBZOfMmL7N7CbnAkGOMT55hMMymc1CAICDYHU+aHoNYB6q+mWI+
         ZoZCMeHLI82ZhEwLNgX6TVgs0ES0I0VAd+TFoWGs6PIDz8u5Hqe3G+lwF03pG/Ayo36B
         I9bbdbqUOHALEdjDQ+gfW+B34Wvj1jerOZP7Aep+KqWO3P2nlpp+L0CrWdDv75idMftI
         5y1g==
X-Forwarded-Encrypted: i=1; AL+hErFyNeiCVToq7Oq8dvRW4zAHa0Ydud7Js4C8K6eqV+wQyTCD64qY++n0DYA2/CBPHDotCe1K2utffBSh/Zm3Ng3A@lists.infradead.org
X-Gm-Message-State: APuU4Z+Irzed9lcEb90ARGw5QOagAR2n4IGodO4wD8uR3Q1kJBj+tWNo
	+kD4Z79/d+Nks+eX4QZjpkzj3ZkJ0V3IWozkfrzuxJ/WtJsTOelXWw5a
X-Gm-Gg: AZFdTZemJ77GItviZ2fEceA4qspsIj+6H0bFhBh3U8J6fkWrUPKIeB1X7339CUtUq0W
	Pryeri6JG5n8TxD/OIQEv2ZTOP/4FHgZa1ShqEtckjvFXEtWcxSdZqf1gcsiPk3Y5D29ayYukDo
	qarkPwFL2ppbgtLYnysRX0mDscVWa2w82LSSX3WaAjTqzqe2KYhzrCftgwTnABA3qX2fgbLFCoP
	+C27J8QkbKfxNT2kUS7vZUgVAXDj4zmCLuOfd+vTa5msBiuW442E98NRiOB03sPWfKC62UZsFRB
	niUzxml4Yo1UZ3oAVG8G1dI5YhI75PAkIYDxW5OGATsvFV7fL/0mOmBSuaptpgqojH+DN3rO7sB
	dFbqCOiF/bfnDjGTxcJDHbaDjvblNzd/nCzuX9+Utjwu9/hROQth2sEyu3ZMsDdb8he3Ggwdp6C
	CB2/xMfZas6cMXc0PNsvk7+F32kRCz7Pv2QWwctUSDWQZBm15vkOYbCkjlMQTXlQnuJKrfd0A2o
	BrWWaZmRJvDWmhkQ7+eCGOz/9wBzASG33/hebKx5Wx7sNRxKamDqSm5Sor2f9UDIPAD0+XUVPdH
	LgbGRcrNsPglO7z+sw9HkA/k8+5Bl5TB4Un7aVwesOBpe4VhLl120LeQWb4=
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr3214938a91.58.1795185736231;
        Fri, 20 Nov 2026 06:42:16 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:45 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-2-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064217_569731_F834EA85 
X-CRM114-Status: GOOD (  10.53  )
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

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index cff9a02e8302..ca325c21b9bb 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,6 +115,8 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.56.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74040606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zAMtQL0N;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BkPKF4+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=; b=zAMtQL0NJ0b0LMdS8SGgVM+qi9
	RvalbWJNh5NJlhRY/xnJYLkvSUW1uyRqOrbTua77lR2rDnBSW0OI6x9f0FT8tM+nS/Yg8RNMMBaFv
	Y38tBCF81L2hwYadruznCanyNCIFYLyMHOdc0g5QyaHVdPn9PuBa+FTuq3iyDxtRHWs5EqIdSzxCV
	xa31wCd+9yqN8UGkVXIpw+hJacPTXA4SqZGJq1qwwbQBuGd4Re6AG6gkAKHFquGkBuhtLcX8XwQ6l
	Q/gdv7CbSXYawr16JogqnNoHFQfViTaVOZq1BVgDeqNJaRBubSytqhUq6GptjJMajPDbmNAMCJUnW
	euM8piMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiv1-00000000gYd-0ous;
	Sun, 15 Nov 2026 22:41:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiuz-00000000gXh-2GnC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:41:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490585eddfcso2042306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782507; x=1795387307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=BkPKF4+KY96XX9ZIzHKQt5cauB0gjeE+JHV24kZ6HS1GL/MwDtZEyGiKaORpv8pwM5
         wwhgvtH/4Ktzxcjf6GZ/NYIWIvnz9EeRRvi2ubixz7W6dCewLD62bP5AUL2E4uBik3F3
         t8A3F3oTAVgGRT/94kazjy673JZWrVLuZEFf8fBPN4pZksdAUd0JwmLH/TiCXq8wf3Eq
         /sKaiQJ5VUC7GLBIUMCtkWj7YbJqf2zkKvWwG6oSN1Uy9UdLLLM9Q5n+nzHas9afPeYv
         xoEl2weT9PWyEwLRNWEGbce+OK0kOTuGZ3zBz8QBqhMoTSJPgCY0tMqwOqtPDz/1bRm5
         eMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782507; x=1795387307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=hgGE+4RsQ58APDcwfNbZu1XrjVisOHYMyJTTC2oKDg+y5mlT2Bbo9Oq2fqz9glDzpc
         417Oq13oT8T8p7njpGs534vE7p01yB5JCS2Su7Xd1x8J65KKN+3leyLcems814DswKQv
         XgsPHvO7sHXBho8jaT7riiXmRUprROpERjTb34cL1Vj3Ab3xNuekof+V6Q9CGB5bAlVK
         zVNKF07iLAICdUN8lwvpnyNwNQ5Gkzml7aqpj01/EJfU0AeyKXwoYOia/Opn0OVJLVdF
         VEkg8jBsIT5saIsvnd8ALeOhVp6zmsnVjJq7VyLKGoSN1EWwsm7QLYfWOqxfJK8VJjb9
         rVQg==
X-Gm-Message-State: APuU4Z/5nC8IR0PQx5hfum4lF5m6R2N+gRilXHG9W1y7M96kSCj5WBz7
	D8jz233AwkXWy3xyS1f0fked2Eo/b2siaAJpZe2KYE/n69E5Vbp52ySU
X-Gm-Gg: AYBFou00sa9mmA3Kp8gWjILL6c2piQkrqL3FPCUs/gPSOSrIIXSac+1VXMOcCoesFok
	bmQnve+Pb5p1BfxmlPIsilvgxMAwmXzDXUMgDr2Mu4Ffn/HmlIahaq1NgqJzaIhK4Dstvuo/9b7
	NHFbzdr/m56hN5BmyxyM3Xb9e8gJyzXRHw9MIqtqdkoskoXN0oQ706ki1lqYCfBe4sDFG4qFIjj
	+P2YERUF+qXMUS1Boei5dhMRNis0N3nlmchEZzdgn8UK5rCRm182LdKaPrym6g7YtTfdej+T6zO
	QxnlqbxQmCgsLqUeqcCZSRV948KYMwgyw0k/j+9UAwCYcIqbTkscCf83ig6GenHL/qsnXnwksxy
	a4jgsqOoZnHuWSMh2ronfnLFA0ReF2c8afeQflR+ZVgkS1AwVEG5kvxa6BjN9F+SoygtdSpnGeN
	47+eNDnKhpBMcT2WG7+H7wFIwXjLtJZsLdN8tDuqCMsqkg71S+pNwrBqHW1jJ8JNIbzdMn4MPKc
	icf3LZ7o/8EoJn2qbiEIJK6zvI7cQNanVOwVPCkO8PMOXpUnFmfCz0YbPTaHwxosxZZK/k5wRaG
	0HeUOHgW669goASlixOPlRiDUo7+mqaW/EoRJdWCfzYa8Ga3HSsSlc8YqzuTj0wFUQusQ7dqFft
	gcF+MCPOT7keTnHDsxPRbZKNF3phf+kBEBMJyGosjZOVaSuqDoFQR0kU=
X-Received: by 2002:a05:6000:3108:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-49c711b7ee1mr19686269f8f.21.1794782507434;
        Sun, 15 Nov 2026 14:41:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm17986572f8f.30.2026.11.15.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:41:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linusw@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
Date: Sun, 15 Nov 2026 23:41:36 +0100
Message-ID: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_144149_582969_84B49909 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: 0.4 (/)
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

The I2S pin groups are registered without the _pins suffix, but the
i2s_groups array still references them with the _pins suffix.
Update the group names so that the I2S pin groups can be referenced.

Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 3da7f3799c3f..1f58752637a3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
 };
 
 static const char * const i2s_groups[] = {
-	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
-	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
-	"i2s_am_clk_pins", "i2s_out_ch78_pins"
+	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
+	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
+	"i2s_am_clk", "i2s_out_ch78"
 };
 
 static const char * const sd_c_groups[] = {
-- 
2.56.1



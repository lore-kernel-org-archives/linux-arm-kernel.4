Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC9360A2618
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cVu3plO9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jw9cA95s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=; b=cVu3plO92vlzk8ofix9tRUALgC
	jJ6OamDeoCcIWbEdYJXxSwMZIJAqTly+gY2PqPmzdZduh1WBv+T2+vcb6O6ehVAV89WWR20OLsGYn
	4W2btwhP/Ue3BGJZC1fMpwMwwAnpttv9kxuu+JNRdnStjqnYAq0v+druRDWl3RoFotcZm+NqMd9QE
	l94pQSJnCVuBkcr2XyV8Novf01KCDwZWzgX/x+QaGPvTB82ralFilOZxU33duP0sJFnC4nzQsz8te
	vBApBpKlGmfZL5l3jWFQDg1ClNpWJMcxqGyDEhzcOUKOq0k0nbMbHYPqAZI78RxPN+l7/+qz/pxDH
	ks0+M++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xg-00000005i8H-3nV4;
	Wed, 11 Nov 2026 06:10:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xf-00000005i7w-0Wws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1607252a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377442; x=1794982242; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=Jw9cA95sE7oy0z6PI6pMvg6O6rvhzPnCZMvZ/LCQe7qemfEDylH14/tTwAG7gl6Qvv
         W5rgF0wrPW0nT4hBCA6GPiC3aNSXkZIlBWxnK5UqDrFZ9Uia6qCNbCXTIamJAN1znF3f
         XNEKDUDNzLeSz9DEG4LqVDCPZcTRmFwRS8ExnSgHcRnRHfuQFq30HeqbWE1OA9W1awGI
         Qll5ZSq6+8GJA/B+M+C0KNbY8lYSt+ASNDz93hdyH2H7YoicQHHiSCsV+9WUAecShpWJ
         fUPcteia21Zocpu8WeH1YFPebsFbM8cfMVaIpitEEIPW1sVASej1x6mO7e6FMReFZoVo
         b9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377442; x=1794982242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=e13NdR2COvOcwLFRlCAON21d6v8DeBIpC7z7SRrvMSn/puS5uW/Ff4bRD42VwXpzfJ
         MpmZY+rzU78vvoteOzJrgWJVXtzSD3BxO+5Kv/J4mmP5R32M4xqLamYXQDDgMkfzsZW2
         vux56BX5ohVh2RMkgKjeoMZcSokRooUJ2EkEW3TwfmjI8eXds2+W9Y0NxK6RiZI74jrx
         RFCr1NA+2NxUnFbO1OxyyrxtTOoqUdgrbjSSzLmcwyztL/CnCJqU5HTf+94UEaFwte9C
         VVMTFOF4b8F+WHruu4hFl//TZ1l2V7Kue3mDUk+MGB4LwSgU+AC12kzvhgi85ANLXQc/
         8OyQ==
X-Forwarded-Encrypted: i=1; AL+hErH09O7kowlFIOGCS4ii58MvLYk5p2UfhsApoEs/5FeXEU03Ig2hJNfS0g/KetU0PxijT+RpRBKBA9EYgTDQGL0W@lists.infradead.org
X-Gm-Message-State: APuU4Z944qQ3rqOPpvrZbgJlfFgr9KP83TsaXg/7e0QdcudgepExcA/O
	wS3kbwuXqtnDEXhZpB2L2Y2eFDjaNZ+5A7Qn+tY4rYS6T47TWvKNIEo4
X-Gm-Gg: AYBFou3RYFbUrBlwn54wLVKgc9IYoG8m51YMq6NQ3hB9KjfRWz1qBP+9L6zWiOQQ81U
	h2C+3zY1tE0g1yGjHNnfNFQs38uWR7wFBpxyaNUZQRxeipDeYUTZBO4Gb3zJBya3Hc7hOCS+tGr
	YABx4ZNn7gRsibE8/mb0AajfVBDQUTWSTU/tdnB2od8n2A6QYCQnVp0rLxtsXqbKvs1g3rFzPdh
	D4zH32zNmhg8W28luxDHTfosyZYmSeYsS4/HL+JygNy97OL4RUoeLYpZTknDtffw2mWk15mSSi0
	a73NmrnVD62G/PgZOQk8etqBT6UFCYq5YxQiYdBBXF2tsfBHPOGM5Wz2yeN8eyTN0SUILOecK3A
	lyPlFf8MBkPMGW4T1wPrJ5DxbMoeXaLMQI4r8BimMgv2G6x3sZK0w2kqNL4VtIkvaNUfUX05M47
	37MEbO5B/6YX2DG0PJj0hyMKa1nXthjAajS0x9Wkp8RHXBreLjFffP3ItBo21VPAZ50hojka46Q
	T/IJi9qhYrQhWnA4Qa/NVhQKIjuzNjZVJRPLXciHPpjJYERseWZbzeBBGnm0nKedjP3DDZVB0m8
	p+6jf+mMRRUOGSUz80r7WgolY92evevxSUMvVsKPFXj9CK3WOrg2AVreLMHgwu6X09MW
X-Received: by 2002:a17:90b:518b:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b182f28620mr1681142a91.29.1794377442187;
        Tue, 10 Nov 2026 22:10:42 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:41 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: aspeed: ventura2: Add ADCs and GPIO line
 names
Date: Wed, 11 Nov 2026 14:14:41 +0800
Message-Id: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEH9GoC/32NSwrDMAwFrxK0ropsSPpZ9R4lC9tREkHzwXZMS
 /Dd6+YAXc7Am7dDYC8c4F7t4DlJkGUuoE8VuNHMA6N0hUGTbpSiBhPPcfNGYxcDbmtnImNPZB3
 Viqy2UJar517eR/XZFh4lxMV/jpOkfvZ/LykktHSt2fHN9vXlMUxGXme3TNDmnL8eIuWptgAAA
 A==
X-Change-ID: 20261106-ventura2-dts-update-f00bc0510b2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=UzoFWGQnfmpYqsdMkcV1qb1KoSKhE64W4DhfwwxJNuk=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af0PHWv50dwK50Uy1itNGP7amluCEuos33IJ
 m8+J887J8iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9AAKCRClg0K3CVbE
 gZRhB/0S77Vr9H7trUM/qwYjhEcN9EtmC6SAmi4fnIDqkTAG+l3Eqye63n8IOtLe7b48MdNSsbl
 qifRmlBhCqswPil5JAdCsOEW9nST16A+6pZEiO0jU5TZoivNh/VZbGrdMnHPKV8N6T/ZgL9Fs0X
 V82DdR1/gQ+yJ83UbiQIQeZuC51KwIenWTQEWWqszLtDl3FIO3CqmuWA4JF/S31uVEfd3cgwWn1
 fIGjKtlB36OGnqOG3ljRqPEsEb4YR+ItMMaQWXB2xIYDcCTA92fICinPRGiIX65S2hZffCOMuWp
 4qP+FkignX2Q2cWH0lhE539UmhWlBfqIMqOOvz8IxtCe9oHu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221043_179424_95A82240 
X-CRM114-Status: UNSURE (   9.48  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds hardware description that the Ventura2 devicetree
applied from v10 [1] left out. Patches 1-2 add the LTC2305 and ADS1015
ADCs. Patches 3-5 name GPIO lines that userspace uses to detect the
COMe module and to reset the USB-UART bridges and the 88E1512 PHY.

The LTC2305 ADCs use their internal reference and describe no
vref-supply, so patch 1 depends on [2]; without it, dtbs_check reports
a missing vref-supply.

[1] https://lore.kernel.org/r/20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com
[2] https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com/

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v2:
- Added the ADS1015 ADC (patch 2) and the 88E1512 PHY reset GPIO name
  (patch 5).
- Reworked the cover letter. (Andrew)
- Linked the dt-bindings dependency.
- Link to v1: https://lore.kernel.org/r/20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com

---
Kyle Hsieh (5):
      ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
      ARM: dts: aspeed: ventura2: Add ADS1015 ADC
      ARM: dts: aspeed: ventura2: Name the COMe presence GPIO
      ARM: dts: aspeed: ventura2: Name the USB-UART bridge reset GPIOs
      ARM: dts: aspeed: ventura2: Name the 88E1512 PHY reset GPIO

 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 45 ++++++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)
---
base-commit: f4dcbba2ec358f7079daddcda7594dad9746326a
change-id: 20261106-ventura2-dts-update-f00bc0510b2b

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>



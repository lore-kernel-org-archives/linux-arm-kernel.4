Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959D7606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZaw0O5q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UlySDR5+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=; b=rZaw0O5qp+wqC7
	b0WzOoKZHdmgrViC2t+Nmi4E05AJFHdqFsYQF93UZvqJnTIFoSkBJLM0KvMbwfiLp/rjn7xI77Q7p
	0FfDQtbYjtFzgdzqb/LZx7cLBbtTBJnp77RxKoDkBJw3G+I2n/c6Q5xwOHTk/1BjX3pHh+SzwH1u3
	DlQB0CdFhb0FY8QJHdPE44NAhfQ8lZ8c7CEqI00dwDlreidfsg/YLaRdvrXxrhRjay/nJ5/1W4sgI
	aR5ycpirH0AvGSSc2DFXy5XR/bIbLJuLIBT5VV39kxF3JNhQisXw3lZOSCwM1lz3rxWXGDxUmcseG
	tFrrE1lUKUwTng2Ux7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xu-00000005iF5-1D6N;
	Wed, 11 Nov 2026 06:10:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xo-00000005iBZ-1tV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e987b4a710so13231595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377451; x=1794982251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=UlySDR5+iJ1/d+xq2szroZ0t4ogexMhMI0CWd/3EMLK+vdpFujNiZrGCIKINrR2PJ1
         0WnW0zyJIABC1zNvfveqpWwFCDxbXhatintn3z/D6thfuz/e+mFp99kP3ihhBqMMrOBt
         K+bYT6RZLrzqFfMjaNaccSo0z4blUL3g9EuHuJvYbnVoa8KkbpEwUkrUpJlegNVKuone
         HCOdL2A6o2+EfNy00arRt0zONrTSjT0elmMiINut4Kf+ujctcaZSb3pVszEKbIkvLDRj
         ecdGx8k8mwnAeovpgf8EN1xrZ0DN9hss4Meq1DGEfwaOv/AOxiucs5QbLdJS1gw+Ry6Z
         UbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377451; x=1794982251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf9jlObbsd4CIoq6s2RKk4rWo7jBbta2pgzbHELu6Xk=;
        b=rRWZt3neU9AdKbjEQ+z4JPir1EAf2oPNmA3ab3mbQzNAdqdgZX8r6Md8CJki7VTvO7
         ocW/sAodcjd/pJ6T2YrU4LAOPDcJv26UBMevoYuWCtm/LxXE6IKxnB5antNRZpy6ClhJ
         0xMaCFWTfxt4ZaIk+A3q1wSFJc/1wq7zCahBK2mMLF+K/2dD7fizkxWz5V6JUUPjgqPr
         K5vzPpj4hpb1r51f9CMiMtkhgaMilE7zNZO4AO4hamBc1dZvCYgEwixIcQGVjorrCCJN
         A2uKjne4WaMaZ2/b3w1DZsOGDG8lUgpAJOL06RFroeOkQNeGbz5RwWiegMW06uBi+r9/
         vudw==
X-Forwarded-Encrypted: i=1; AL+hErHTAmJeDYLiVJzGWLnL1KPlRocmaXDzJeoXPxg1a2NQMzKnNJjWTWq+jpEvvEk6YBJ58qxM+ev1vy/51Iv6q35E@lists.infradead.org
X-Gm-Message-State: APuU4Z+P5lKMI0fNkBhpnEliUTRvfn61ymiGu9FIoORcMoxcQJV8bJZA
	UX2HPjsYdkA/7dIMTwP96LBDHCergegTmQNATtJ7HfoDATr9b4CpC43m5SYmVg==
X-Gm-Gg: AYBFou08FDdN7O1Xa6ZcpRvVvb3mwLi8cCRJCOKmtXRZr4cCcz3Fh8SN2j8fd16f10M
	Bv5cCP+HTwjtR7VvCRYeoHH5/uKKqmUkRxsmzXTJHyB9DGOtfKz31HC4ouM2ZSdpUN0c2bcxQq7
	k83Ebanoi9VVtf32o+2lGOAYZa/p/6JPLY2NHfGSmh5Vx8YScMz0he834c42lpqlf8Mg8a8W5fP
	qmh73k9yiW48uvSxlY5I8K2EuSe8vQnK74MU4hJjtGRYp7qmDSNpXh1jIXJhA5PxTd9ZrXMwJ9+
	RXLq4gMibvyXYrE7aI7X/q7l2Oj9c9ytzYtV3u7o/TOtampg1HG1Q7N5bq5EV7q/r7eV1GMR/ff
	68oWqhyyVwrs0Xa5RnsHdGqxGuCEdCkvFRjPnfT7cLagaJRQMF4+5uoZNKHSX5c2+xI27oPon27
	hPos9pu/Kk0yJTYVpx/uxBz4DLLQ3ryqr6cl6adX6MjbpC/SpqMeLkinc2sQcZ9MVNHKz4kATvU
	pfwd0LN54Ld1CpCAHIzysNCAPxm0S7vFfmlK4F6usBWGB3lfslnBnZ1MO0UEptLGIAG0T45Ic+H
	qT+vaKzwORqQCXVCFs3mOXOmawQUd2NGh6DHCvtdH0YL2pvxJ++JmqCCb/LHx/YBjqqJ
X-Received: by 2002:a17:90b:3e85:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b182f91c63mr1169003a91.37.1794377451297;
        Tue, 10 Nov 2026 22:10:51 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:50 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:44 +0800
Subject: [PATCH v2 3/5] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-3-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JUNGHAUf0IQHmc6IEwFOoWoV3n/zRCC0p3wp8n0F++I=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1293/fjBxZT8qUQ7Ck1LzVeXz+XG4VA8iq
 w/9bLeZK7aJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gd/HCAC29OQHvHu3hEGDxLtfZftWnVo9wSObeWfAYbo8H0gxB9xNgPeWCZdlnrbWJaoQW8iLJeJ
 nPbdsyxL3kL2h5sYjLFrZnPBxHUwI+LfYDHG6DgjdoKan1x0CxAWR72tkxv0/IVQBNmPl6DQajn
 KKjvIhtdPdU881ZSuBaOyTGfRpRImiTZbyqsZxsiAxhZMFWIAn/H1qOgkwVwnMWwJSBGMeW8j6E
 J1ox//pkKu2LZFkjIBRIC+LvdPkEd6r/wWDSJz7gcync1njgf3+fn/IfKkjVahhjIYguBFTnmY/
 eCea8i+6hU5+CkSU+JgM7oINoUxLzE4XfqQxXTyYAWnErhL3
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221052_504276_2EB353E3 
X-CRM114-Status: UNSURE (   9.70  )
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

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 21c40dd4bb84..c683ac19aba3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1



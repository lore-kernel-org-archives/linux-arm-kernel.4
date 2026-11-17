Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MSaVZrHF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4ODO9RF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=; b=MSaVZrHFiGTRMEAfOgq/u7305n
	cN9urDy1N0O0EeBo7S2AfajIkPJlimfdGvjBgGXS0zGf5yKOAtMiP21XU/4+tINbb0Atucbg8zxak
	DuQV1cbeo14O2Q/2LMUcwmS0lFuIXPV/dmYiZvGakK9+d4wgZr4nYKztdo/0INpcV/F2uXFFQxuAo
	ocXAtqwIdkyZDkE1r0c+alHOiK0T3RApEHhJOiH868mt0tFIoViTwBDCMk+SSyhLSWxFbRMLFuTrU
	hi/S2m16AwmJQqk5Ikv/OmgWkQA1QQh+p0VzOShDTVL6Yzecl5B0o1Qv3L6CThfYB0ylnlYknyOoF
	T2SoRsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC6-00000006d4s-213c;
	Tue, 17 Nov 2026 17:42:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC4-00000006d3t-0yVm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:42:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso2307175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937326; x=1795542126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=u4ODO9RFPdry83oh6/HP4oUP38T8iJFzHZxESu6uZc6kes6sze9twYOIpmJHkwZ6EO
         jdjaelmVuhedcCW4pGPth1J+kMLSVJWDmwqcXaO416oqU6DcIe5eNMVF54ogmSyd0Sv+
         W+P9EtkGNpL3m+17e11Je5I9Hneq4O+Jpq3ceYtCKIcQjoGrmhcE8RJjv12+fmaDY+a2
         6FNCn1bsguuyzOxgzryrUNriGbNjPdFpxGPpTnmxDubgAFy4U6CY7cekGLckllXwfEdy
         /zOnxSKvLNSm2dX3HHCR3F5Yem+YqWku37zRN5Ic2bmTB7uUeZP1i7LXmDD8IyBfh93O
         OEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937326; x=1795542126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=cCscQiRjLWygjLdMmXkQa5Nla8g2G+ao/1qoMx6QqujY6BoOgeS+/Cre68EgmLt634
         qrNj4skW+r44cXW9HDhLAiOlltqLoC4/ftEUKgM5Ov7QhBO+6PMBgGfa1J8Vu0TOETLn
         qO29Pc3ihVVW9JtDO6TeQEJKa57hyHPqEaboV5bu9BDqgrJk2Gqi8WeQpTYNlBNsCDDz
         dr1vBg/4y+QLha5aBzaSSVkBnHEfDhJUJamn2n8b58Vv6sA4hkU1ivAzTwuqqs2SM1Ky
         3KX4jeA40QtekVwiPantPzfF1/3E0Dv+U/FZCMzrbWCY6LX1u+DxsTfCKMq1J6OCwU/J
         rHMg==
X-Forwarded-Encrypted: i=1; AL+hErEbQJbSBKrRJYxbQQOjGYg3PjW3c51JdeNov9iqKI3o+b6sDSi5L7pBXlxywgCnVTrLfsQfXlmEGsKqVbqnh9PJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9yd2TnbLF1RAwZsiHqrV9u5YJEfiOhmez35yCd/9FJsPjwmI0o
	vXQnGa1dVlIX89/C59SGGuK3CqGGKiTxfB+iOUmx2NjAyasRbiPo9/rd
X-Gm-Gg: AYBFou3ewNDorgiS99KDf9uCr9kbJI5pFshUhZjaDzYwAXfUJhgHfsJrZs5YcP64/aX
	iM/ePXCEoGrqW/5OFqxfb6GBa5BdLH+X2uw0QOAivNHHe69wU0L9CBnJcMzzKAr3hrU5vgIklWv
	fajbCYjaR4WLYUWq+ELLXEHUIU9B+1CSUo0ZQWDTBEOHREqyYtwMqhnfmAU7uNWt0zwsmWByk6H
	rcatklzD5/9Lvzv+ulwc2E18NXaDH/YU0hEWFohUMlzT7HNAeHaJuDw6qBzmRhBs5vxMDD2gYwh
	IplS5plevwf/UYI3lIFcGhEw1qsy1MJlv5hlOLRR8QyoEn3laFLxPDr5Ouwt+MG4Auq2pw1Els5
	8NrqwTNYa7vwDiq6uQyH1MTM8sn0mjS2ap83S564J5y1FhpQIDUJugoOtYYqKyxysVBi1tlDFTH
	i5jjSz4VDhRJvVqfH5z1tYBss3THXoRokv8H/XlZEzSvwwccBxPH1DC35So4ouZRvAqD+jdLVJ5
	368fV2Rjtc4qYXAbdgDFv9vri8ShSVJGUvanrpa05GUGzASt47Yq+YWyOZEiUxi0VElw+6r3eCQ
	ppGy/T8LqaOocYksfe16ktctA+DM5d+nsh12Nd3YUSKlvy2A2zxrNw+Ez3eycT235X5bLf3jizW
	91yvU
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr207958615e9.8.1794937325497;
        Tue, 17 Nov 2026 09:42:05 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:04 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add ath12k calibration variant for Silex SX-PCEBE on Aquila AM69
Date: Tue, 17 Nov 2026 17:41:54 +0000
Message-ID: <20261117174154.549590-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094208_284329_8CAA90AB 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The module
reports the same PCI and QMI IDs as other WCN7850 designs, and its board
data also comes in variants for different regulatory domains. The IDs
alone therefore cannot identify the right board data. Patch 2 describes
the Wi-Fi device and sets qcom,calibration-variant to select it.

The qcom,ath12k binding requires all nine WCN7850 supplies, which only
fits designs with the chip on the board and its PMU described in DT. On
modules like the SX-PCEBE, the PMU is on the module and powered from the
slot, so there are no supplies to describe. Patch 1 makes them optional.

Patch 1 is for ath-next, patch 2 for ti-k3-dts-next. Patch 2 also relies
on commit 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration
variant for WCN7850"), already in ath-next. There is no build dependency;
until both binding changes are merged, dtbs_check reports the missing
supplies and qcom,calibration-variant for the AM69 Wi-Fi node.

Based on ath/ath-next.

Vitor Soares (2):
  dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
  arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant

 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 15 +++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0



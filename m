Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 01:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yZDq8Ndr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8YQITBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=; b=yZDq8Ndrt2lEMStcEbFtobVyu/
	IHMYrXWoeyabGKh4BxM+A302hzgkMbiUrQHIhdY2su3ghwlzMIFvCsgs/0ZhqqiMOaGf5lPKpAGue
	W3bFhRXIaZsWn9nlOFCt2SM61h+TZ3BV55goap1qTxH7gNsgJRs1S5a3yWbOIeM/w7TFk3mwWNlOq
	IWBgv3936goI53ly3pycuGOBOstF8g4kW+fc8OGQh+02PsVK3pL8oCNYcVqk9st+gFT7fqV3uH7CO
	hBMpQStySzkCDURhCsT3uf4lz2JFYTZQcsijGkKC8TDDMivcXr7CMDEreNGhm2w4OKPBYMpAXTUft
	3i+NIOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKm-00000005JfU-0L2U;
	Tue, 24 Nov 2026 01:28:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVfKi-00000005Jel-11Ay
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 01:28:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a070781f63so1777305b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 17:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483711; x=1796088511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=l8YQITBKXHEY9+FLt+O6GCBHv0mifYOOU2K1Q8Ur3zlzgb3mvmbIKVfc/iTutA82B3
         k35T3yRL8BYZPWpGnQwSzQPLu/7RISQlGazgE43h+iZaFoICDSb/RhQyMyXHXUpOlCoP
         EIJOJZ+DR+6nnpZdioiPFdeMauVtqSb9pirOpT8uBGQYpHAvSWR/4cysKKCjJHx5ueaD
         LxSWbH2kLUXPZw//lWiR04W6b/fDJe34Za5g5wq8ETKszuoujGxrWBdKtfup5SyMr40M
         L6+uD9thBewOxsri+y11dDdgcN5NTxfM98n5zu8d+52unvimh4rBu8uUMLG5jrfMWo7g
         ZZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483711; x=1796088511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=WyyEFudKlTcbvuwdWiAcrDN2uCnxhvFUVkFjrLGg1ul7WzPopAlPM6mSXYSDgrnOA+
         cN3yEzSBox6NA3PUV4vnZKxEGsXqYsNMRDt47zpFOMGla7Tl8lYkn1hCORAusz8Ou5wJ
         iwU1+BJEyhJ1YSRMJd6uQVCAUyclqtSoteaHfzjo28HfSIvdlS8h4qb710eACxFG8a+G
         aIyi/XeY8HhfN9ivi2stg/kEsfOmpeR1BFdplmtOgzOEOk4moLrhVUyQKohYr7AL6A+f
         7Dzv98i22w77oyojLfiOnuwCw/IciX/zCFTAlrVEQ/5h/Wnru8St+iaKbNwC6bmOFlJ4
         T4zw==
X-Forwarded-Encrypted: i=1; AL+hErEtgqRi/Y6InjQ8+awfJMqmgwN4cSIkGN9n5iZezDuR9yDfmMoNE9UXwJNDkh8rkfmSdzBM7xaycfuxu2IPPBDa@lists.infradead.org
X-Gm-Message-State: APuU4Z/bAYSZj6MLqqIvuBVJoZ3keveaYb+ofoPfzGj8bAKVdx8hK2/2
	w5rWOoEWKUT6h2elijvnjd6LVAsNq6py7ID5W998OfdfswH3NMGY8OMx
X-Gm-Gg: AZFdTZcLnZsvld+5EMKgenzKSApMxYlhVUEhdIrXnAJC3rQCdx42vrDulbLjialzXKw
	MAnk1nnuPi5SJN58gzWAU15jWgKtMSkJHOhFO5zmUHo4P1G3ZP5GFP20HxCQcG4B+JcWV93anga
	LUu+CUh9TLiZdKWttdh6DHlNyXLEZX5kKe2CnVuzUR/sRMxf+0/xC/g85f8jfCFUMHyGXvafCHV
	ZQoi+y+9ryqTKv/yPfFFYTEKzOG0E485jo2R12fmfUi2wRFsZ6u+lB5nzJBy87m1m4CzkBv5QIF
	Xnivw2xu0DcvirN9AE3rqe0y8vYDWu+k80l0uYmfa7HiTqtvGlqVHx4FPdV80zaoRwODah5zLg4
	BJzcXh76n3+JU9wbqblviYwuaIUD265MOfgiTimjJQhXRV34E0g2mrPvChjfuMDfJs0isUVPVe1
	AQD20nj11K1laVT0Uxxst2PeUW7zgcjaBWgOgDZGe7R9W1eTGSxnu7BGjtQEoUZumuQt4I56L8y
	Zx+m2chC5vl3JFvKPeFqValbGj7EsvLOfjQn8jWk6dvwNjTtqX9hXHZCipNlXNcCY5OUDrhUK7Y
	/MZ2ONPVczNcv2/5tDFuPZpQ9QryUxOgxjryULcam6iKQYTzVCuTuo1wJ8K5ayhrS0TNRlpeDDJ
	/
X-Received: by 2002:a05:6a00:1788:b0:88c:fa50:1a86 with SMTP id d2e1a72fcca58-8c87c09ec5fmr11915415b3a.25.1795483710678;
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Tue, 24 Nov 2026 09:27:34 +0800
Message-ID: <20261124012755.328774-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_172832_305989_AE4B384F 
X-CRM114-Status: GOOD (  11.31  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver to handle these SoC-specific semantics natively without
regressing generic SP805 users.

v2:
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261122065549.3265519-1-mmyangfl@gmail.com

David Yang (4):
  dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  56 ++++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 305 ++++++++++++++++++
 6 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oNav/35z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uRSBEPII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=; b=oNav/35zlCmk6I3Dd0ktC9d/p6
	h7J8RVUhry84XoXnBfRiTKFdYBx1KFaa3bDK2WIgq5hsNMSbuv8vIqaaQGeW/+hJWvinfDMNLgTbq
	tdYJnEe98O2ADXBNvaQUA4trS5ZaUUYIlGJhnfgbiYZRDrnsjX3pWpoiNYJsYOKyvhdevM5z9Ud5p
	jxx2udKy8VV2E4F5DI2rb7dJFFxdCd1BLUbEdm4XIkEICX/tY36Y8FFSJK/YwaIvmRdN45YfUerTl
	9DUshI5Aa/FHiPjna5SukrWUisQ/LhIqKuusdxxhzcOXS75c/jLGZ5RoCsJlATKvbivH0echlrU04
	gEzkeVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVGV-0000000CSCr-2VLP;
	Thu, 26 Nov 2026 08:55:39 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVGT-0000000CSBG-0ATe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:55:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3adf89523d8so6485931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683335; cv=none;
        d=google.com; s=arc-20260327;
        b=rMyfnmHQ2GQ/NK6gp0ilRkIMdyosnZL9XkmG7AVnfyT9giHNP44NzcwOVhkTTSig8k
         O9gob7MR2JbbwFVq4p9Te+V/xnPSCs6fnyE/1HpO9iVjvVfiBds8LgaQt3VD7bv2q15v
         dMygCoMEiuXjk9cwTwE8moQilO1ZI22Q0el163Y17RzuVDlt9wy5r1vU4N7btbcGezI3
         ONeInaWyPSGqGp5yXWW1Pe4DBHoEJahPMuU/9AjltQbGBb8SZ15WLM5GzqMgrf5ppFUX
         a3mP6Zr6nX3MdDXEQxIv9WsfT95JkaBEElS8P93IrYS2nmOSpaWiYJmNhCzL/6xVXJui
         4GJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        fh=lOIKWBR1MN4ePxepL7iOW88LzvzPF9BVzT09qVwJ/zs=;
        b=N9wVCsr2VXHJLv8qiSEGFN+I1eYX386j2ncs4svZiOQdPcFSo8k90o1gZ+oYy9cTXV
         9GJr/nvGuX0ypEZOSv9HgIweDI3A5s4mEaWh2suTPsYkAB/sXLhKMCAreA0qtYGoL6cW
         Wmlw1wwFRWKNrKPufBmQA3CQPQoY86ugxiUgoPgygyQjU50VyvS5htiqiKdEa+hgDIhx
         agYy3fuVPgv664mR8MgsiU4c+AgVStlvK7bl7wadbvTHXK6ozt17If9M8KKiG29j6Dp5
         3NEj6IWu32FQ0yZ7+xU2vC/TG4I5Ks5NNZ+XtgF0aKd8v2wj48KE35RqHpQNVhnvhi3I
         uPbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683335; x=1796288135; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=uRSBEPIIYR4IezidyQoIefAKTpYcjMh9/HPFKBbi03nVCxSzq0XKZZDr4p0JAiqSvH
         4uSkJshlQ32bSmGt3JDSWMZv5KA++MwYGVs68jMSDcpTc6TxtwgfyHSJ7Bv4fc7ZEztw
         KvZn/E8ArcuXrMNGVK+54PzJnZwXZVP36CUzA20mTITSEVnecKYOJdCx+/sK+XSgTXX+
         PYOGEQ8vrV4a+Yuu1OFz3bFpOS4M1S25GhmxAqyFMKdHb30boyJuTQhI9ys8G+cD3Trd
         lHwdRYdRGdQfM9ve2dOR8ptu9flRxD6TSgInABBfk/aU+gvdfFzz79clQD6xntlX+0S1
         mqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683335; x=1796288135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=eIZVQrFJZjB/lDG6JHyizY0ZMBuZ+r6JRiU/xfSrxuaVUHlYXn4YQ4u8bmWlJPtWfO
         2YMw5d1eC3rFMlFakUun8KuQDwreG1sqJRvJtFht4MHNn5dqagTS8TeSrSKo5R9a+VyD
         nGd9KhcXbFcwMdlVuKMTEhYHRYSzLeKQ+huB/GT00R2CX6ylDar04/YyRnqE3P97ehPY
         HbBuClCAmkBVoca81xAhhGCHKunjpGSES0hslSVGGx30UkUPrIVicWhWq9yQvRYRRxJG
         H1+mrOm841U/S1a0rCqK6T0+/wyumEOeLUokZ0nti09MUyo8qA6XtnqvV2wLSqVsyXFa
         tOJg==
X-Forwarded-Encrypted: i=1; AL+hErEispy4fJMzussFKtUdJUQsBXvawt3Vo35aRv6LN+ZEpnyM2f3GnTSRLNtQB5pjtmwQLs9+//9dy6fdTOcq8xaQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9n05wiPqRfTkpYimbqmCckR9HyMZB50fBVvZ6dA4wSNvooiByW
	0yKyMpCXzVzGQ9TJFN57dWq/8nIPc5OoyV/uhZtpoN6LPrAWGKI7Fd3gI8G6eKa82yweBeq4hu8
	GyFadZPFXu8HUeFhfZiz6D0Ipnbu5qB8=
X-Gm-Gg: AZFdTZchk7Kp87d9KCKzJxr7ci8VL7hR5Ba+hrMvI94j8i9pUoAcumxE2hOPhYjmtQE
	6UJtSUPdoPHwl0SRDhbwoHApb9tmRY7LWTRzskMYPDEjM/smlnW5ibdUwY7D5Pq8fHSXLHFv5CE
	Vgy0A2kXe8Vd6Mo7iGu9cLY3irJOJPUl7mWt5nOMm5iGwMR4hYKHtS68ZIHP4+TFVA8t3mzvkjg
	ZQM0ROJAx0jvyWM9x2DZQnH/KEeetSBHZ5AEj+I4fXknv/sB/1e4v386aiYGIXz6EfpImFDis0R
	Kdk+7rVfh0ZGJLhHvKTYwBoI8Jq9Nx14Tcz0cO5yX2G0itXHvi23YLC+fuy21xxoFlrMorgTora
	xosQb5kH3TwLLgU5EXRj+9S3Kv/KUxQTcnxE1PBP8KKMCt+Or6rTNXMu/hOoy0Aw0VV2BkYI=
X-Received: by 2002:a05:6512:1151:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c1bc7ceb5fmr8223250e87.5.1795683334857; Thu, 26 Nov 2026
 00:55:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-1-231196049a3b@gmail.com> <20261123-quirky-scallop-of-beauty-c662b7@quoll>
In-Reply-To: <20261123-quirky-scallop-of-beauty-c662b7@quoll>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:55:22 -0800
X-Gm-Features: Aa3M54pFlibDAmDC24529Pztyl31CflHnU5Me60OGDKTLA2a_3s21NJ2pQ1ALv8
Message-ID: <CAEy9hNX-TiThoXZ9+Q7j=bB7PpNBr7Wjz8_sH7C081HXka4xHA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005537_123757_8E899AF1 
X-CRM114-Status: UNSURE (   6.82  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sorry, I missed the report. v2 allows iommus only on the RK3588
compatibles and drops the nested ifs in 3/9. It follows once the
arm-smmu-v3 clocks/resets binding it needs is settled.


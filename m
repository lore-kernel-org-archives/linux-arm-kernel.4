Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B73606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vMAjLuK6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqhk2HeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:From:Subject:Cc:To:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=; b=vMAjLuK6mfCYsh
	enI67u9p2qSe9SwEr+o2TBtSyTQY32s0io0fYqaOCwQTEHhT/aQCAwywGSJoSyvlZEL/bHhpxCfPw
	6bqOGnmvcaXVQYAavD/1t0zJ0+3ZAaPkYRzAmOfC+ykpMYX+hDRvzP0KcasjuwYS7PlU/prcxrZE2
	aDBgRp5qBHLskhaev06DzHtbrS01DBioZ4ZsLo9+kuOYRdk6CS/+9Z9Pt3yhpX5wWAJ8P1CE/O2qT
	0kulwpi9MPJ4nigILFKhFb5z4E4hnf1+H4GxkBq9rWRojZCKDg1EPpDC4soAqcW3RIeHcstU/DLwA
	PSzlB22EhxMMSNsuu74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WV-0000000GWdD-3MMB;
	Sun, 08 Nov 2026 19:25:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8WS-0000000GWbl-13xv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 19:25:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c49b431f022so38721666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165946; x=1794770746; darn=lists.infradead.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=qqhk2HeDze7Idksk5Vcwk9YyV0OhZE4HRvs1nEWeRzoZwWhHKp7MWyr0CmQdfocdUQ
         Re2G4e+61zHHJTFAJvpmDKA5Li/X5k0vH/RIHL8v/C23W7nRZePtvOjLiBtGPWmiyVEX
         AXbp5TP4FqmwbImAdwY3QmciRMTnFRztZoVKXg4dklxgOO0rvDgHYZw48cvx9armdwQ4
         wDjlYVhI/7rF0N7EQsXACaACNaj2Jxyv7B4bP2odZIYmmu2Ht5WWp0rgkVI0pQjY34we
         xX/Q8bqcNkKO9RmZmDfOyoyz4FHRRVfO+VGASKGABUNAmbx/6iJ7+1kyTXDG0rKtuLnk
         v9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165946; x=1794770746;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TFlHze0xZHVHECFNAToGkMpUA7NwrSzUebXukclDxc=;
        b=dly0E1XX8toAEQ71TUvmVs/RdgEChkbidb4tDVfZFN20zSPtMVEVHoaHIIuxsTd83s
         ToymsN9B7Xt2K6sppyOIkKQ9LR48au6HUC8ZpRO6I4PfiY6syhv4himnJfQevAy1KfW1
         uc36QhUrFeoz5iY/he1/+OEmjOkonUa1pWkXqn1Oo4YS3AzXEAKRRlL4jmInbmajDqsc
         1YvM76l9IjAGJvC4RgjQgHyG3QOztT85Dh9IIeMnreMQJgrCaPyr5sYnMnNX6vPKqTF6
         iOBL1ZCKyq0l9geeyHweyAnALxww4jufH/clqd/x9U77joUKSCa4vIgwqzyuL9Wwja6q
         8HCQ==
X-Forwarded-Encrypted: i=1; AL+hErE8xHOX6WEvazPJTK0HSA2E8jRXMeq7QyCPYacXkckYRZUCEw5vweyEHYuiZqVuD5D1bXjx15JpGzxHygvOAn29@lists.infradead.org
X-Gm-Message-State: APuU4Z+C+7DzK8XsIwzcGilszXWYCqTcWvZB1qVJ4mx3yGfzViqzF8a0
	e1KNd14B1sIYkMocfP6hPuUr15blj4f9ndg7pY4B25FNwNQc+AL/gMLc
X-Gm-Gg: AYBFou3y+/zb8OKFN8h4bsI4a7yRg/sCFWJZRcv8Y3V3vKcFr5ZBaC/KGgErvkgVhBK
	IW3/KwUlAVJ6VAa7M8zija7T5OsXLhAE6rPvlTFcC3ejUvl7ZiQNAq9YdMDv4ARMXVM8FB53Gcd
	E7CjV40NkR7FLnTF/YHKpmEblMSbSGT8gwH+3U40cssF/N0/7aljTNRJFfmaZSyXz+E3ulUHVn7
	MwLPJMmSr8sv6tgJsxQKISCZIHisjRLiTDJQB8xf663yUK0HZyGZffetp+YCaZeZVzF/tsmE6Aa
	2v0m2ziEbPOqyr/VLU01od0gnyqxewquiMetiMZANptvGdNXOPxFG3hOOjRIJL1KNDDvhhghLfU
	ESg7/uheSqUcsKgakABKTOQfOAX/UtrYqxcmlO8mBx0DI12qy+BquHI7EcjJ9oktXdDM08yAFt8
	MwNh54Wt9QrZxUz2ukyh0CitKjSW83+kWtJs6uq/6XsmGZS7VJO0X/d1JTA+YNHECTndyZEVBx2
	yhF1gwuHpkP0coP/m2ykuJjv+aljASLSw8AK1r1Vqz7nBeCtQBm0TuTtUhsJXfdUMz9Y2TtIEVp
	mnJvDU0LNrByOoGKhTVqO1+JxpsCPktvscXnpVVGtq/QyIesx1NXCM1Q
X-Received: by 2002:a17:906:794f:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c4d6d522af9mr142299866b.23.1794165946088;
        Sun, 08 Nov 2026 11:25:46 -0800 (PST)
Received: from localhost ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a998a5asm81036666b.72.2026.11.08.11.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:25:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 22:25:41 +0300
Message-Id: <DMQ2QUT58NN6.10MAQ6P7FML2K@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add support for MT6895 pinctrl
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
 <20261108-pinctrl-mt6895-v1-2-f704c443b31a@gmail.com>
 <sashiko-outbox-203909@kernel.org>
In-Reply-To: <sashiko-outbox-203909@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_112548_296765_BDD4C33A 
X-CRM114-Status: UNSURE (   7.62  )
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

On Sun Nov 8, 2026 at 9:39 PM MSK, sashiko-bot wrote:
> [Severity: Medium]
> Can mtk_pinconf_bias_get_combo() and mtk_pinconf_bias_set_combo() read
> past the end of mt6895_pull_type[]?

Right, mtk_pinconf_get() reaches pull_type[] for the virtual EINT pins
227-246 via debugfs pinconf-pins. I will pad mt6895_pull_type[] with
zero entries in v2.


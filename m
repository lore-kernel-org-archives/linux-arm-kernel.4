Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D5606AB77
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 05:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IHtrvQi3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZnIxVtK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=; b=IHtrvQi3P4pEKbQ1COGYEoem6y
	W6eizNgKBNWupzTZWMACC/BWjLRysMVyVWgqdFFsosbytj8lHmb2pBXNg1O18fmGJ+FP4ZATqT/T/
	nTp2jSjGpd5zBpAOOE9b0M0KiVLMubxAsPc2o8vZFFDlzd2DrFEm7jUYuXqzYhBhHYnP5WagUHXgV
	bvxU4fEspg55IKjEWmSGtXExgcmOGAA23JTJtVc1L14fxmaYnrVo/OL8ISUS/NxZtz/tqeNoU/Dzy
	EWr1wXfAjDPGCKhqtbKeymCE/7uYmAI99ZUxhMga6jOcWsdJkZgOWKCHi4qNCzfGNG0WWlG1RNcud
	awP4XqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5uM-0000000FRvZ-1rIM;
	Sat, 14 Nov 2026 05:02:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5sy-0000000FQO5-0JgU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 05:01:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b147e50af1so268864a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 21:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632467; x=1795237267; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=iZnIxVtKSYp9LjwYy/+AP8DQ2SEtVhdwt19g5FIiYsNs1/XThu0kjpDjTciE+/I4c/
         YMeg9noWcOase15pmWynsTWm+OD7xr1ytqSVhNc0SeNXLb8dDjDyn9eygYCbGDImQa9e
         JBerLTEj16xVF8gG6SmU5SIBLP+TB/kyix+5IPVvIqJX9ZJ6DU6Vb3c5dEEbGuZ6oWlw
         fp+xuKhsx7qWYyxVvATwygZ01PdBZxy4N8E3HobTkI2z2VT5k+m1puLzemDGGF9sTZ1T
         00GBD0pPbruw+SdKT17fOsIFXd7IBA+B/VM2jEQnM4SGaHXILBXdrMIm9GLKPADiWSWE
         V+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632467; x=1795237267;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aG/eE5olsJwInv+bEoP1V0eDG7IVNV9VWAhiP+RMC4=;
        b=l7Rp2q4GObDbFJt0CSSdz59E9FLgWpRVTCsG+gxeoW4KuN2EMej2p9cMxsOBiLenLD
         WQXCJRIniLBf4be88HAHeaeAfJPAWieSWYu2gD2JY/YQHWNpdhkDe5HZJHOu21wM84SX
         CDo5mFkr22O5IMimiToNFTF6e1WqVIMwFn8GliEG2gQJkPdR3HXicuNr+cZl2nHD0hRi
         ncjsAnbZIPLwPZR37/wBIVtUOJbUblZECpWtIs/xu8ZbokheVHqYtT7FJ3BFBu+RKfBj
         iR2XHmH+JaTIVtzwMDAiiNHjvTASjO+ml+n2ROkSfn1kygPNSPAv3VClhSE6Suu9ZcHd
         DzKQ==
X-Forwarded-Encrypted: i=1; AL+hErFv6fjNBZuguzFPL7ZCsbx0OvQMxf31BxdMPaR1KkF9jt/IEP5wVtL76Ta+n3On/Pi6OmB4oxTz1WS4P3ZlwVNu@lists.infradead.org
X-Gm-Message-State: APuU4Z9Y9+1Gl57TpM/0RzxnWAqVSWZa+ldtMygpnnp/p2oMi5b0jS8B
	/yU9Q/tpQdThowTLn/8R+3me1KdObCWgOfzu45k7MZ4RrldnqsD6j1AW
X-Gm-Gg: AYBFou05uD++MaNM0SZLow2eFmdW1w8/bkUVBQ07Xl0raKeC5+A/RomgbOF9ebY7aWX
	hvxYZtzG+UPs/w+r44++/qcbU31Y+13DgQlVL6YZZpPOjZNRSmor8yGNcRQ+WPtCrJIfegKB2Ux
	iUZbNkFu42RVp/J/5I0MjlA6HHhOaIMghBFAYgkOVAvOYGnZ6GgC7Comcsm40fanqGzaPrs8jo8
	hwu8HrhtU8Wz4x46nhC2dCeVdhHWk0bZsBfGQTMcnsTJLFOX+s2PSWtkJrnEjtF8FvCMJEp5myg
	9RCk2hEb9qFPB1ENbOzrQVGvwTFosXjmHv6V77dATvNSuSDVbeU5m4nCCQKFXavSjwSnrrqbh52
	pfmOZ1knILZb9kIGqDVdExxZhVXlaoKudhIq24QtroEwSWQlRxzTpJEXI5KY+XpNOBZze+D9JKX
	nCH5la4bJz0jKwSb3LC2XusSOfndUYBXIYrHi+Vrv1l7ZJEO1Alzm9IdoSH9EagbLN9xlygPX6s
	KDtP2F8EKVWjMfLAd7kB/JTbl4wkqGRH1ss1oWx/99lbzpdIayJJ9NhrAZdhha1aTS/882zZ949
	KsJeyQ32TU4PC0U/pj3+Zx7xqtPw3njJ6IApSNdIxLPZ75wemreaPR735YVrGWCVC8jE/eZFNsH
	9BqphB0ZJ8ecnF/sI+gX7b9yB5t0=
X-Received: by 2002:a17:90b:1b06:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b1b0a0e7c9mr7131064a91.4.1794632466846;
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm125917a12.12.2026.11.13.21.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:06 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Date: Sat, 14 Nov 2026 05:01:04 -0000
Message-ID: <179463246494.3611640.18079808669048880957@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210108_143469_916EE363 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Detlev,

One more data point for this series. On top of it I have one stream
decoded on both RK3588 cores at once through the CCU, as the Rockchip
BSP does ("soft CCU": each frame goes to the idle core, and the CCU
holds back reference reads until the other core has written them).
For a single 4K stream that gives HEVC 227 fps instead of 130 and
H.264 121 fps instead of 67, bit-exact. It needs two v4l2-mem2mem
additions, so that the next job of a context can be scheduled while
the previous one is still decoding.

I'll post it as an RFC once this series has settled, so it can be
rebased on what lands. The code was developed with Claude (Anthropic);
I review and test every change.

Arun


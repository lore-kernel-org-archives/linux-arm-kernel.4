Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPFL6u4m;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2UCKDe0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=; b=JPFL6u4mT4GksffjCPSUttcxhd
	Zvu5ozG3ZYnwKnF0plJmQ7dBzKQBuWEeyfoAGPRMNdklo31OKYFTHWImwl5deZdmnEQJCdJGaRM5i
	F+JT4vfBzDTcNrpEjDqSOVaaM5BEyc3qgoCiONN9kjcVBOHJVloUQCsUafX39iKMOAlxyEQJXlW10
	elCfCqe+cOrNIMWDsDmGZ8fTmSQ8JzbTb26N0uUq7i7SuMhUxh5NDvxKZPX2JjwsY+k6BJJ7z4y61
	dXZAmA4xX/tUipGCQvkLI76/uIcR45AnWQl/z3RrsBefiyFmi5+Q8NNbgDjxM3bArhLbzS9e5KecZ
	tmluSrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3gt-00000000tsT-2mGF;
	Sun, 22 Nov 2026 09:16:55 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3gr-00000000trp-0uWy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:16:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so198318e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339011; cv=none;
        d=google.com; s=arc-20260327;
        b=hRfRXooIjBzoQr1b7yToS2Z0mXbQnNs+3d9TMRoVtwJjLj1Rc+AQp8yZ2DzM1XxxvS
         Syygqq8tXmkThv0O1hyV8vJNh0oXMW+XX7nFXzpLvlrSeAUeR9c6ZPDk390tz8UB9rXw
         8WvzkE4FITx7SjVO2jAT7vrlVzk6tFmUR9oK+wf/B6aW+qz3AcMvdlsBl24Ap6WUFOzw
         IbY1VX7JtYTtK5OsRGRw15eRG0xLlRkT3vDnf2894Rmn3Vz29SKInTx+POKmLF6hSyGW
         4cBzQfGZn2hR31EQF5+TDBjkRcgaomEO0ZzkBLprUDll75vblOmVTmE+uFx9y6rA5gJU
         Wcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        fh=til0K6NID8t4IOfSJN7XJdGsPhkp5Qij6/2ZEBqFq7I=;
        b=QpLCtIcLa9blWolfMtErHA9uSM/ugIQzv+aMIuEXwSuWWxNmQSvvx6vQhziA74HUR7
         R4BZQ7ClQ8Nrb8iY37U+YiwgU42MpclwbN2kbFkp1s6mUfatVpsebsCrv3F8K251/p/V
         v9Ug0J7l4Us8bcXd1bdZ5dG5tC8r58S2/3bxs799Bbi/g9U/GhXQw4Y38FgyDN2W42U1
         eJ9TT2RBDZvKL7eBHUG6zwix9fCuJR3mmL4BpeqCeYtY7+/2iFk+lFnzQOkOj05Osbau
         /3ixrtKlxdlYb1VFA0ENCI62ph5k+js1+UE7maPQB3V3LzJtSofrz/mm7+PSsIEklk8u
         OALA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339011; x=1795943811; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=g2UCKDe0age70HqGJPoem9Igd4cf6HsWaQFfGXsPrV5U86CRGpEknjag+G9TQhYamK
         RVlCIWj9vs6SttGzrIhYihmd9cZHGgRCHPnzrEqjRY24VQQbcJHxny8xWub5Fw4V7mj6
         AfmSMAgo46s891dcc0iywxXTa1tB8yEb9xBxf+9WyOOzpCwy2OVDV/sL0r+XuGnrNrQH
         lK75+IEL4npEVIhAf9q2kZen165yMpMYndebvruFN3yWhVrOre0Oty9g1RlFQhsmEreX
         fTRsqS6a77Dr2nx2eIHyiz54bn4I0CsDKi6KdbmST6j7LYh+pbxGB/Q9U3GDKc1dCJTH
         iODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339011; x=1795943811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=K5XNDymu1fEkai0+cd9ZsUVemcr8RuQsn5N6wZOdVT0HnMwTYHx1sjVfZ/TKVH+glS
         mJjMdmJFGjjOFc1huMeCdgA5UsukXVVNT0P5trZDO5k46nzoaiIivo27rIEZnmsZZEW1
         19azS621EZm158tWa24khexjQe/rZkpDDAt7E+O76YlWzVGpNIWeosNeO4DSU55zE96o
         32g3Zvfvo6SKyssHGZGQdar+ykIpNv/CTBFLZMKmeOZUz1mPUylaroBbiG8dZr9mIMfa
         k3bEWJy4l3rfDXQeUJEj5lUYdD/0u7gTXkyLUxvISqaxBQLKtUEA4LIKQe+fC7ASP1Ax
         VEPQ==
X-Forwarded-Encrypted: i=1; AL+hErEVIMn5PSzVXGF5GX62W4YsIWqI2LYYVNtrJL7Sgxr0Lzhx/F+VOUFJI3mgEOfqya9oqWIXpPwWoASls1NAsF4O@lists.infradead.org
X-Gm-Message-State: APuU4Z8dYTrHKwHGnJOxgXbQ7WL3KDD/zU5J8VTZiQToilDv6slg9yXC
	9Xemdpjx/BkVrB3jz/9XvQIPN4IwBwLw1TTElDnIEYXFpu7nffMmbGVNyqu2V5WcTBoZlTVFhIS
	o4rbM2vn9hPffEz+tQEETxjPAFKI/f4U=
X-Gm-Gg: AZFdTZe7c7DYnRWtAxsY7/bZCa9PH/DALPS/WlPkAk9PoCo5lZ9dEuBUvC0Hogn1Dqq
	YDbeFtA8ax+aAn35tZTDLY9ncHungGIUrWX2syNrAS5jBTIlVL9t8D4UrTcIbdENIT50XrmtDaI
	8UGHDyozF6x+bcajxTslIJzabq878uohkzCV2d/bBeCBnVHtQLAtYwLbuBSqi90/GyXibxwz9E9
	0ZlwRpUuFRKpxjhUvnCpYUR13E891zeDHNWIDvEjR1npcbrsVttE694qUDrAV5HYiRykfwOerPl
	hpOXe/1/YjG3o0KeVxyMHjWWtM3wrRAg8XxRZg8i3qxt5Fl6yKM166tWTSeXPUc8ROXKEfsqYrQ
	HyyYhcVlkAe4Xn7sQS60IUXHjFhno23v/pr0Y0bfzkh+OqgBzkDiYzfwHtfojfOYrNEd+X0U=
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr2187197e87.6.1795339010786; Sun, 22 Nov 2026
 01:16:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
 <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com> <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:16:39 -0800
X-Gm-Features: Aa3M54oE-VNyvNZaxxRREWe_L_ECyiIpVpQf2rmUEBWZs2-DphbG3Q0KscfmLqc
Message-ID: <CAEy9hNVXZvfbW6U=Y7aiONidPKee7npGWpWuR2yQOeUu4aOVfg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_RFC_2=2F2=5D_media=3A_cedrus=3A_mpeg2=3A_decode_M?=
	=?UTF-8?Q?PEG=2D1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mripard@kernel.org, paulk@sys-base.io, 
	gregkh@linuxfoundation.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, jonas@kwiboo.se, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, ckoever@outlook.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_011653_303722_E48D24AC 
X-CRM114-Status: UNSURE (   5.04  )
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

On Fri, 20 Nov 2026 08:08:50 -0500, Nicolas Dufresne wrote:
> MPEG2 requires MPEG1 support. The new format simply add noise, you can
> fix cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.

Thanks, done in v2: the format is gone and cedrus selects MPEG-1 from
V4L2_MPEG2_SEQ_FLAG_MPEG1.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com


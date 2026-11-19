Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5pYMXrh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtTQf70T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=; b=K5pYMXrhZ/SbwE
	c6/KjVsq0WUAI+IMm/PMycz2V9rIR8q3+zJ4dvaBzMkryiCcg8oqm+6uKq3jjCzjzi+3gx6fT5GKs
	HAtYfdf/kLEJBClqq8O7Bavgj7TSXYmMuh2YHRMRKKhWooBnbuPkId8Mlqqa8M2MRVkn5lzHk3veM
	ooMRs/WCvqFHY1w2nynelVuuYpHMqN1hnY3TNJdzW0rirXDz0VBMsBIssxb640iUedUna6HnZs0Go
	zDHJQYh7mAihUmFcTDWizNidD5f1io26WpPgCaKeH8ZUr9yiHGfqliA1TR1l4WDeTaDcJI9xlFg/p
	5OAr+TO857oDhonQyoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8cD-0000000DKwb-1Qmz;
	Thu, 19 Nov 2026 20:20:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8c9-0000000DKvk-1LWs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:20:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1572745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119611; x=1795724411; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=DtTQf70TsOCuYJC2fT6urVJh1LFlqyirsEt8hwnbJCOMZ0WNxaEHIfBz6EUQAeuYnK
         8q8JVqJzlnMj+j9Yb8SvH8ALKtXoFhV8DyxoOU7lCD6b1enEwLQLT7An1+8Z38tcdzYN
         Nb1mUTuMvYl+FyGEn/nYDkOKnolEUnztj+WcXjMSLTL/eUq9rDxGevG1vmLi7mXbMsNz
         sBM2BFSn9lRzjnaVH3zV4hJZ8pVtXxxWkBeNCsW/afqsA3hqHDX3IBBazTi3T9Hd5nvg
         Qe5G8+ME+QflWJNUhP60rq6UWyLYrerc32fDPnYV9wgfcF0XQIgPju73eZq8/nFe6i05
         rykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119611; x=1795724411;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=OAWGDyDDJsmr8hb3zx/kGzgkwLjjQnogL4maiDDACqDM5yNRfMTi1YnPAXz450xHkm
         dPkDaLk0/gsKWJk1B2qAT4UgCI3tfR/Eq5Ful5HN4QKjhIt/6+Neh9T0LV3QnhYSll0z
         OVu74xubiq21ZNkpC5Z+aY4xGSjVrHqKZOl0ddvaurcs0tdKY561K5WxgBJtEXQucQ5k
         PoGQ+BF7RMIL1On8hIUgFcxQ0VUa8EKsot/uu7gFggCNLSGNG5yot6kwcpYiGECjU3+z
         HEe3lMmF+O3qT71wQB1ZdV/6JYfoWxieOwMd4Hs5KG5iBSADlmW8XmsQ4lOAyplvGICC
         vceQ==
X-Forwarded-Encrypted: i=1; AL+hErHqBoe+/WfOwDOw39maIKtQaBUx+nD9Owm1/2pQL89J8h+Eu4i1NRyBOa9YC/1NY8XjFrCYMo+r85YY76pSCdYT@lists.infradead.org
X-Gm-Message-State: APuU4Z8sDs1GH87JKZHE8k2ASccvSgwtkEMOsOqUMKH8fSIbQeZyVl19
	1Y8/a9e+AUJMmoQU8M/pD1vMXhmua5okykdtzfK85Sc+fNe1DCRoPvUK
X-Gm-Gg: AYBFou3CF+PE8SZA58PzQxbB11DuLziuB/EHDLm0+Hj30KQcWEl2/0q2sqXhOpdk6cT
	8ikdcK3xGsUwX8OOD4erA8/zfyeflKN3zomOFEQ7/LNPEdrbzpxJGNuJYSVu1KnWuONX6Z7oDdr
	KX9dTNtV8gFHlOZqNwktUdiR6+SqNJNXr3hBy2SXp+o0vPs7Uvt0aG607SMikmUxksdK4Qgijz/
	XHs059mH4y4JA8nEWoSZ9RNDmxJE/08B5X6g8ZPP62w0b6XLyRuf0qMLtKbGmcm20EhIPtAPn4D
	afbpUJwthoM3Y0DYpPO/ogJlbY5iX+4uR3LJAronjaad5598OVd+P4xPfmZv4x5RduajbUHMDc3
	l5M6hvG1t6W2S+tl7/YmOZBJw+Bwz13wnvprH/bYE8wQfFI7KFE1fI9QGQFL1gKEkOVf7u9Xzep
	i60iuh8CdpOr8x/qKoLuSJikIkD6mMJTGUqIKGkjnJEOtRrBHa55uk37nnpwWq3BgIcswEioS1Z
	V9lsWHuXhRDsNQsmjWasEnkSPOmKweSwtHWlRiqWDiS0kukxAjjtKNTjdEPqMw0ss7ma66zhGiT
	3VPzZa+t/UMdRmCDYfs7ua/rj9EAyowM/xQm6nsC2AXSrtjQMohW6bCnlKH5NTQxZV3hMVQ1
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr14648215e9.4.1795119610866;
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm94509405e9.4.2026.11.19.12.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
Date: Thu, 19 Nov 2026 22:19:57 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_122013_389169_F52C1084 
X-CRM114-Status: GOOD (  15.00  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On 2026-11-18 14:27, Sascha Hauer wrote:
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

Thanks. A correction to my last mail: 3 bytes per pixel is not a worst
case for 4:2:0, despite what tj3JPEGBufSize() suggests. Since then I
built 4:2:0 test patterns that push the quality 100 scan as far as I
could: libjpeg-turbo writes 3.35 bytes per pixel of scan data, byte
stuffing included, for one of them (640x480), and the Hantro H1
encoder on the RK3026 3.14. At quality 99 the largest I found was 3.08
(libjpeg-turbo) and 2.88 (H1). The patterns, 96x48 and 640x480 JPEGs,
the same frames as raw NV12 and a short script that makes them at any
size, are at https://homenkow.ru/kernel/vpu/

With the Annex K Huffman tables and 8-bit samples, a baseline 4:2:0
scan is at most about 3.3 bytes per pixel before byte stuffing and 4.9
after it, at quality 100 (lower qualities are smaller). Other tables
give a higher bound, and APPn/COM segments add any amount on top, so
for a decoder any fixed factor is a trade-off.

So 3 bytes per pixel covers what the H1 wrote up to quality 99 and most
of its quality 100 frames, but libjpeg-turbo goes over it from quality
99 up. If that trade-off is fine for you, I have no objection; I only
would not call it the worst case in the commit message or a comment.

Sergei


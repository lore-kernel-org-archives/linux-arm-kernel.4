Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE8606A882
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PkKcsUrY;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Lv9sxcnr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=; b=PkKcsUrY4uCABp
	LLNYYcIMftvioC1B4/EvRfySryKmqilDMA+pPaau71srMUHo5+GR22efM1RkR8f6mB8scCjWlCI73
	OIekxVK+lNkNrtaWRlcmjERYwtvyRQswT7p7TyWE06BsEC1koaH5xNxa7mOeyL0jiq2Q2cW673I0w
	lfKQOYne1d46oHyEnZrVsOlnLidDF5DZQd5RTaRv/u4AnyJoJj/wyfY5fe6/3gbhIocJ630ApiJ7o
	kYppJMvh4UotOiprHZXRGqFx/o+gmUo/dj6VU9qsEM8wOWfcAWOq/Rd9i6KwkvJ3I0YCj1s2pJ0K6
	1V88LLQ+JP10eHwZmCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5pW-00000006NmL-0BmP;
	Wed, 11 Nov 2026 10:45:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5pS-00000006NlK-1p99
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:45:24 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c4cdc606b47so462746966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393920; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5nz8+FOHXoTCMCXTHVS4WSXKETNE1Dd2F0VuIUOW7J2vnueb2jIgfVvzib/bfj0EJ
         gXdWdZr8w1uKqcPlGHwlX+GIwV5KbEcYwXRdXL3QPhQ004/W8+76+MfwhnVzyTcXExlg
         5M9LxqXJYTHND2mEwuVcU8WR8kpzygHQQG+RHoCTTtT9uNtouXX4Pg5ZKy/XzfuYdtAS
         pekoW29mDdurVotGUSon4fKEp4SrhKZaNeXOQtBJ6Lxo26ZUB5rApcnYL7qBEl1B0wsn
         aaJ3VKrQhHApOvn/VydB0Z/qG5/AiwHaD5oNY1glqCWKd0JAirMt/8PvRHn9RT75C1NF
         9fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        fh=iC2n4o0mMlwzzkf4nL+rbm6qMzRUa44KWAfo2/YlzM0=;
        b=RD62+rsMzO3pabA+qG2KyfoPHMD3aiAO5bE67duTxFw6MSAqyc+NJo52DLDx6i+HGV
         77VgVdnpdbSmSOjtHUOLoAzrVVGMGRphvThhgTD2xfFVbeLuebluLbJIFI2wFzGHdGIf
         6uQXkR0R57qamamGje1d6Bowq6zWME9/V4NX4wFur81QwshWSNP7bi+KagD3P1k3q9Fw
         M479d54MVpHlets5BpZKFDbNLUvSDHmHnHMY8zcGJAUDUqLV6mS5+2OIXKt0gGZXwEQs
         JBB3pxOgs9gH150PLiwe3MnJXmvDYexjOlDmKZ4o0Cdg5F2ioHJUk9qwgvbfHVXbOfqB
         DbUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794393920; x=1794998720; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=Lv9sxcnr3F6JoqcYF+SHhDpyYS0Wc21e/BxKj4AglkKXprbswWo4R48xx1wwUwdN3s
         +m8e3Wm9jtfzWKWwatDvlHZeTeMjkEXGHvHkAkOJxOJTRg9eh1Vq4ks1XceeRBefmx8R
         hH1mEMfE1uu6hOMUe5z4j9XFaDZ+E9kmivE5EBnpfpNKrHdDtB5r1W6ivi22EhevyZfM
         P+uOnYXtmpADhC6A+fP3T8C+n/7pfyBJup1MmhJDGvY36L5T2rViQqHNfxphSnNVMCvZ
         4fyP4/W32MOlc6ni11DBDKm5rE8Rnkg7eVmfvIUsH597xOLmfee2icTm8g3XJSM/zbMK
         Wjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393920; x=1794998720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=pFthEK/Gmq0fMYwiVer16paDCtV/FxJCYkDlIU33K6th0UfZ6rebTThXKXwPWy0Js/
         iVW/lk5b2qjdfwAWbI0SD34lESHEeBaDdFODUHXbEoLJhu/CWd0ppT0WdZkKd3s8ZPXg
         mSXiejZ2AcLSdJqoIiKukplQn609mj+HjlS7kAe0X8v2TsbLW9hxSU8qf5EGXM21ysSc
         KI0uJexE8doUjRd6Ixyg9RonBLooCIWHM0QsniUmdRAOcRxDT1x9AiGt2nNsFDM5Ei2u
         3TCR7c3Ubyb4syIrWZ5FCCBqGG0hoRnYNZnzgqU7FvjVp9zO+lUkWehACieCRsNJJ1ea
         iDiw==
X-Forwarded-Encrypted: i=1; AL+hErEWCcPmNcn3k4KwJg3bAxt8fmGZ71bMITHFmPvuvU7j/DfPBi2nIUSu52NZxpyqY2nKO7Kq2qxNuw4+iYnO1TtK@lists.infradead.org
X-Gm-Message-State: APuU4Z/z+9Drk9NiA5P3mC/ukt8/oucS3Ij8hwPxBRJ3wf78B5H4Q56E
	MDDcf09eT8xQ/WMsPhPypDf6/fet5Negu3T1Zl7526yRTFt575tepo3nfgGhGiwfkuTTcxDB3G1
	cDqwR79C+MYvcxahLD/4FHTeHEqsdFsdXSLDyK3pt4Q==
X-Gm-Gg: AYBFou2aORpmiPgiBFVN5wXdmebtMo7rjU+w3uWUaTJKo+piig77OELD9EGuazERd1v
	iqbFgJxNK/cY8oL2fe4MS+dWsKDwY0d43kwKSIX25mdCLXan2CCOfUJaNuq21v+ENrrwMoBsiNW
	vUYkOfur2PPhXOo+uOo2xv2rfoowUtT9g2BvClQeM2XZddi54/a/8tMmGaumQ8Gsq6gDf7f4+/W
	Fvb0uRvO+Izbt/d8rKzcchDr6kxBOHwJw6eJ5DMtPNgBsP+anBj1eEgsIhWMgC8jnOWUnmaW7/t
	TqI8Mr4ZqDNhYxAV/A0Gupn2vfF2E0pAOJe8giTCxSxdZL/QoOEpQB6DcjIlSlDsUzbBvnr2Rk+
	HzQeguygIGOEG+LYJH8B1A/sHcC4mFy9zPxwnr6yH5TOPt2x1iP+nWi4eT/odOTzECnSPbQ==
X-Received: by 2002:a17:907:7292:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c5066a84511mr152183666b.10.1794393919375; Wed, 11 Nov 2026
 02:45:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net> <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
In-Reply-To: <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Nov 2026 14:45:08 +0400
X-Gm-Features: AclHuK-JFFUWS_xdTW0P5OLa1DScA4kfALrbjXlHmDv-4WjET9Tuop7_ZcygSgc
Message-ID: <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_024522_505830_3CC96373 
X-CRM114-Status: GOOD (  19.84  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaoyi,

On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> > RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> > controller and a fixed-voltage VBUS supply.
> >
> > Describe it in the device tree, including the wiring for both the USB a=
nd
> > the DP side.
> >
> > This makes the data roles follow the Type-C port's negotiation, so the
> > port stops being host only. It also leaves the VBUS regulator to be
> > managed by TCPM instead of being hardwired via the tangentially related
> > phy-supply on a USB controller. DP lanes are also muxed dynamically by
> > the USBDP PHY based on the Type-C port's negotiation, so the hacky fixe=
d
> > lane muxing also goes away.
> >
>
> Have you tested this? As far as I know, dw-dp driver does not support
> Type-C HPD yet.

I did - it works fine for me under Linux with Sebastian's patches. My
primary motivation, however, was U-Boot, where the current phy-supply
hack breaks USB data role switching, due to VBUS being forced
always-on. With this patch it works, and now the DT actually describes
the hardware, as it is supposed to.

Best regards,
Alexey


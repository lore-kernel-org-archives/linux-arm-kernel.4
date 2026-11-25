Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B552606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YnVBaMNY;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=3RllmQYp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=; b=YnVBaMNYmujEP0
	rx/vF9vU9V7T93YuQN1WE84f0un6x+zhC7gV2k2fOohxe1SHDvN5U4gJsnYi7BB0tYiT17BRUrAFB
	T7oD6Xs8BoVAmrfA1At2OxepbIUmU//5//imYJ3jR6nkhV/hhXJcNPnt7SLXDe0oiE4ECfpU0Kv1P
	iZgPRxYz4R0l3lxR6L5+cVESxu+SGw3jUVx6ovm7UvT33aisbtO+2gFGEgWOwbdFgj5WlCF4+F8wS
	0+8L2qSYbB7UwoZPQPG/jnTAytvQBLRoJBjoWpQ9l96PtCZXIYbCJVa22RWWuII38ksgAHjNk+sdu
	Y/NiZmR+evr3cExMUu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWL0U-0000000BQjc-0eq2;
	Wed, 25 Nov 2026 21:58:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWL0Q-0000000BQiZ-1qWi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:58:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c50aaad19fbso698942166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795643900; cv=none;
        d=google.com; s=arc-20260327;
        b=eZeL3F9eSvXKZb2VdpbVwLp2mQ1oYpcAgrtPal6YElmO1VEqSH1PsrY5Wp1WTxacNz
         /UhI9bIyk+JvEISV4z7p8LDQv4GnwZ+8xNj9WbnAG9jgokymum9KhNi8Nnlavf9DpuWV
         u+7BKs8MCARGOcgsA7xkPbjFXKLAH19u36GFRQ1RLhUUp70csc4MkJ3jhO9OTeFAyjGC
         rttXngXtIhEBopK+QWnputWQth7KADk9EzKkhrlVZVEbf/hh1/rTSBs6eCSbpoU6Nuoj
         CTesDuQ4NLQO0+Hnd6rjqavJ7pvykeIa83alVYMo2BNR/fHEZSA9ByKNEiWS/CKbc63a
         ldQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        fh=PP/L1u87hQoPynzmTlGNcbdedqEGDS4+X82pQLhGIWk=;
        b=MKTsNmfEHcQCsIqRupVjPp5r4J3wxmHKq4jAdDmyMtRu2KklVkX7alhk+VfmZjfEP1
         PvpK591mGXwAud9/8rKAlqK2lQpTiUbqzzUfpcUUY81QVMZ3s+VDzZWLBxMPz79GdUFQ
         pFETZBiofi6wBtjA80Lg3Ei9g5fDLz8mpIwAy6go7V4hMSGxfd8kSrJ2lf9T4CT8ZOCJ
         tUp3ihI3Q2f1CKadNQ16xLqONLYXg1POwrBlZ4Z9QEyljGXc87ysOWrIFQuNjJ3S7Pkt
         guDR4Sp2VlubAGm5Gh8RuzvSNTvnicxAcvJQIBs6WXA59IKBm+DgQuRLk4ah6KMH674Y
         ijBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795643900; x=1796248700; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        b=3RllmQYpw+G1tW/h1Ygawt5ziD7uUtwUvlWpFxu1PX26cUL0LHYRTfwLKGBDImT9iC
         J/CAOaPenZrC+6U7GK2sKFNZLjzBZRtYM9I9ZHikXAJgcx4tp/E9OfZOkU6+M4E1c6MG
         79tWHbOdM5rQ738Kr3KTtDg8wNNBVVi0s2+534a86M/VA2gBl9SL8jjKvC2qEzVxHJnn
         CdH3QhzKA3OcBD6WGbeTDkVxzNUcfacthRp0nZ/1gx79gPJzWfE8vaF5KyhQahlzaF+o
         oD8W2QI+HDRybSnxqwsSPUHd5Vs8duOVB7Y4ODCFRl0/62VB5Ap890EsKZwuclSEdicY
         fj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643900; x=1796248700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        b=0NlaW2IDSip4TDSbjVFzvpi4/ziAY1DbT2oG+agL/yLp7XjqF7SYpp1XlZcI71R5xB
         dQIi0nprX5OvOVjyXk+jZxgSe2KIzFiyymb+Xd2nrMwuZFzbzSjDZGb611/3lC7LAbdt
         isCXEFiwKgSaPzMkGXo9FwnjG9ay5VTt2iULRGuJYFTLNCceA1qW/eZCAB8YQ74ZSe3F
         e6F3EQgxD6j3KZuE7OoKmFZq8PWkMcu6WBOsZTjTTwRpJKAiWQIJXxg8SRwq8f0MNu/N
         s+l71mEMx7iLHSReDtWMWJdK6O6E7FS3/NVN26jWEVeD6ZFlgp8CHA0o0N0JeBbSDV41
         gL4g==
X-Forwarded-Encrypted: i=1; AL+hErHSoivY/tfpAD609zHTkxTuVPLW7d/X53NqXbkbjgNVcxmgFbcLU37LGkywyHra/saf7SIqATvv9ysBTxh7sfML@lists.infradead.org
X-Gm-Message-State: APuU4Z9IcmELDY+20C2JEAI9aTbZxdNyQaryKLEPGP8yaqe9zNXkbeSJ
	4wXQoMfAKl3czWIb4ChcNA4KA5oJd2MiMJ8I107UFqcXSjRZcqUQlpYRkxoTHHvpjzzWcxXWeHw
	DYwm56VfxUm6ZkElXeKfF0loizmapp+YD0VhBoBiBvw==
X-Gm-Gg: AZFdTZfLW4HRcLyBGUtKnITXCseZL8RSBHX7fWwatnJmUM5QSbJz+nzT3bLARkG0tiW
	J8J9pWua9IOoA8+XNtj8wqsLVryCZf2pKMNfbJKzhaeweFelMWrOnYUDV4agBNffjeh62NqwU4u
	J+gnQ4tUCEGFoGtVayFrnBhy1O58qIR8o7UIzByyDIX1oyqLJTx2bxJpCVjoS7ZCDK7Wnl/2rzt
	ulewLP7FHdplct0pwhxzEJh1ZXlySDkJjW2xhSysmJzNQNtKCeu4UJt+MAifgqkf37TUQF8mpuT
	tyPNGLnCNvaFEsLAV5fF5w6dBg0RR17jrPToMHj8qhssaOm+UyvlX/M8JUAl38MtaLHVtWHfXd5
	hGnIwwqAASqpCLkgi4rK6B3HlkuP6oXOnRIKImeQv4npD/IXqOT0qN6zUirI63as/EPxm
X-Received: by 2002:a17:906:c114:b0:c51:baf0:f9a with SMTP id
 a640c23a62f3a-c51baf010eemr165270866b.15.1795643900272; Wed, 25 Nov 2026
 13:58:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net> <179563805247.3885553.6358930861216631692.b4-ty@b4>
In-Reply-To: <179563805247.3885553.6358930861216631692.b4-ty@b4>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Nov 2026 01:58:09 +0400
X-Gm-Features: Aa3M54oLnZsGvDIV2wcXPOs8zFTEwAusYc5yVbOMSviur1uF26N0thu0Jxy5z48
Message-ID: <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5
 and NanoPi M5
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, John Clark <inindev@gmail.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_135823_031664_B5E525A6 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Heiko,

On Thu, Nov 26, 2026 at 12:21=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
>
> On Fri, 20 Nov 2026 14:48:08 +0400, Alexey Charkov wrote:
> > Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
> > which currently share an issue preventing them from enumeration unless =
an
> > earlier boot stage left them out of reset: at power-on, their reset lin=
es
> > are asserted, so they cannot answer an MDIO probe. Until they answer, t=
he
> > OS cannot look up the ID to match a driver. And until the OS has a driv=
er,
> > nothing releases their reset line.
> >
> > [...]
>
> Applied, thanks!
>
> [1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
>       commit: 693e0c4f00389a097d710577ed5c24c4ac3f75a7
> [2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
>       commit: 5d839ad9553f90c727157c45471a911f64cd067a
> [3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
>       commit: 9c83b53e6c858a9a8f00ca82ecd1f46d2d723b70
> [4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
>       commit: 620ad5b09bec5abd83d35bf23c1af1fb68eed80b
> [5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
>       commit: e48f1d304f7b69b47c6f98b701aa6f8c84ffbb9a
> [6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datas=
heet timing
>       commit: 5efab9e7c28448f6035e7216255f7b76b28ff97b
> [7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datasheet=
 timing
>       commit: a2a390e7fa9e73ff07d2a9fc002114e299483202

Would you mind dropping the last two patches here? Sashiko pointed out
that a later revision of the datasheet prescribes longer reset timings
vs. those in the revision I had, and with those in mind it's not worth
the churn.

The rest should be fine.

Thanks a lot!

Best regards,
Alexey


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ga6riuMX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCPcjWnQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=; b=Ga6riuMX7ko6wy
	x+xb/d5c/JKPXc5bb2XxklYnv92XHhHQc5DPA07x7Fh6gh54pJws2bSJKLxojWHYiKu7a+adFQddl
	FNJDIBwKXBe9Px4xolJVIQ5kpnfxhWsaJkB8Hi/QNrX1XD6A+IhYSBaR0FORRp0m+ZL4z8WA2/ZmJ
	HSu83RECTeYvRZjWGlbhcNkI42mh0mtaKHdE7RAcxJO9kdKqkCumSzO5zVm7xJ1Js1EzEvoEGlsdf
	bXtyAbhFapPnPetfewRJGBGpnx4itnWZYJat+vww9M0PpFcO+HG20x5jT0c8fbFnFVItdEnVfTW8o
	ECaQNK2CznLWVVjd+9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdww-00000000FX6-3y77;
	Sun, 15 Nov 2026 17:23:30 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdwt-00000000FWi-4B5W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:23:29 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-55be673e029so197871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794763407; cv=none;
        d=google.com; s=arc-20260327;
        b=d+KzkFRLPD20IwNhFj8WG71cUtII6v9Na0WXcsuSG4adMY+YFSgwtOy5mf3zMMp0GW
         4XcFf4R1YOZm80xqciRI4ciAOGOUSeaHOaoKbsiktP6SaqgdFmLxilyjFq90PWnHKpHY
         d0wZsYR4zHJHx2ooOHkmnvg7HIyjjuAlfQQ3TLUNYtf0ArRW4xTJObtdMA53BnzU35/p
         UNJmfUgSzAd4BHTBo9pUqcQiziZ+la3COUoujrp2FAkm+xocs1b+WC/fHTsqYxTel+hW
         zskhRrquD848oUYJPuO7T4288JV48ZHd9puAMfrscIvlOCWzrHVDuvKuz3Qrn8KUQvw5
         wkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        fh=FOluTBaM/tgZz3NNtF3MxsJbcm+2m4f/gVVBUbd92GI=;
        b=nh1FL6nPHw+sFzPe067xdt3Mb1Md7Yf5Vetp5kRUdsEDBEcdHYF5NVrHmCdfjZtuv4
         1L79y53xew1kCtDjTAUqGX6S+rPqwYiRG+/WfesxX+RNlabpcXbgzu3cE81/U12Xv7rP
         KJpSUf/LKNeyDM2j/wb06tL7pIuPcWXnHtkGh+RW/YwtJn9HuE6sh3kWFW03Ix+f1GWa
         XrtBWSzCOtX8ntr45KQwaZ7oo5tJp0bLOd3RKP4gF3SlQVdTtr2NrznSiKSYqTTMQq0+
         y60reqMjwtJzPXWFlhLTGaQsz7YfkXUHfQkpwwKyhk4cpx4DJjHUdKl/NSNP1c9IvOGs
         SnkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794763407; x=1795368207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=gCPcjWnQtH2axMxYV104F6Mk1+QCsiJa458NZ2c/ac8/x4tOHtInJ83Krj2un6NLx/
         a5LbtR2BaGBocK374qkzNCa9IBrx9UuW+yqf3pvbq+FGQW6NcBi4gGtU8B8TTW4hyY6l
         H9uwfct7mTd6FaxKm+pZwDkU5lKcNn08ymFmrnBTfQJ40VzuwMFKe6Dc5ItEfE6RMgyA
         NcNDB3VrCOWTClaR5EPV6ujFBzd6UyTXKSxBkr3o95KaymIAqLUDNzvvkNcvp27Kgs+D
         ij0HZVD6VDn36m1M0wCaYX0yUWYWkH3cLKGCr7NSZ2v4FW6giIUZXHumCyXQol0LwEo5
         nY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763407; x=1795368207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3GJPV2DHNp3ky3wZW9vV3FEZiN/tK0itP4DFAjD/zs=;
        b=qg32N2hXCHiKiNC3KVydfezYP56R7alMERqDcmF/1pMsokAD9omsDk5XIHrbAmWehU
         vuMFvymY5XXqmxrXOqT760mIE6H1qEkiWSaCqvqyZvEsmFThcXopjm4rw3RN2eNIj+X8
         v3XUe/AACiEX1PZA/0Sy/iHy9xAAy76on7n1mojCayRFklIuFpvfv+4jgqvOp84QAFXD
         cMAEoxZU/O7ZkNZ59wU0gSG5mGQi/iLrCGn2anYdbgC9ypJS3kPKkigEsKOFSBy4rvZ7
         qB8jsAGn88E8ehxo6E61DQb38zXdkjEYZ5vDqiLB3VZuISUML3qY1a+zZx1Au/VD0Qrn
         fuOw==
X-Forwarded-Encrypted: i=1; AL+hErFz+MJVOLc5MV3WSaBm9OJk4Em0S+l4naHEtkpqxbhgY+ohGRoKk0iGI7jLUzU37+QTAQe+RdmTLwfrSICtfAWF@lists.infradead.org
X-Gm-Message-State: APuU4Z8toct5SSHXckc+K34tJ5UFizCvq1lJUGyjgm9nikN7n6NwrX3Q
	nOPAB7rwhIoQwUuMBDDDwwFNyVYJU71ehayT02PANjvWyXsvEHMhl8IDfDgs7f8hNeWg1ZBVULV
	MXMtSWh+2CtMHDIoQ+4VTeeQJTaRkIj50HhE7qctc
X-Gm-Gg: AYBFou38Jt1ZAdBqIm5VshAGZeUZAHvvQEAVAxN+riqsw+7opcbn7kHBXkAELaX2nCN
	Z4DlpypG0wOD9MnI5dUVua5RrfYHWA00r2S1fnjjvTFyqJflFg/M960w3UEMO6qkORbVDD9o+Qv
	L0xOeZwtTwD+qJbsRI+kV35I/uhkA7FbFpp12vmNjUeHxrUGBeJwuJRSu8EIX9oVGnas88U/b1S
	mZQTvY4BFD37x9udqLwsRG5CvdTQhk03mTeVRsKPmJnDIgWYmnzEJ3kYPB4NbOCyXldN3Xhgly1
	Gvddg8D3ucFQdpWBjxky8waqL4WYGbxriJn7cXygswiYmsrARThOiOcQM5igPZbf4+0JYK4eTOh
	dfBM2IlQVr5sOQyHuvxVtEP0LKA5YsVWnKJgNYmgldwolA5XeAVxI7gjE0Ty1UHlQRo3fkZgl/R
	icCg0ejywPEGh4fhedwokCzPENEw==
X-Received: by 2002:a05:622a:c05:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-55c6934cf84mr23298521cf.12.1794763405925; Sun, 15 Nov 2026
 09:23:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-4-vamshigajjela@google.com> <au4HBJBd7AD6WCeY@monoceros>
In-Reply-To: <au4HBJBd7AD6WCeY@monoceros>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:53:14 +0530
X-Gm-Features: AclHuK_5V_UVndhWj1-YMtxVTtoYTR1vzesn2C0sHyenO3AfXcdkS_s7RvC5uV4
Message-ID: <CAMTSyjoGH-vdL8U-ggQEF5FmgDkWvHNKxceauSM6sW_2_mWDZw@mail.gmail.com>
Subject: Re: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_092328_066456_2C0CA536 
X-CRM114-Status: GOOD (  12.78  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 10:28=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Tue, Nov 03, 2026 at 09:56:07AM +0530, vamshi gajjela wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
>
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
>
> > [...]
> > +static const struct of_device_id smartdv_spmi_of_match[] =3D {
> > +     { .compatible =3D "smartdv,spmi" },
> > +     {}
>
> { } please

Will drop <linux/mod_devicetable.h> and update the sentinel to { } in v2.

Thanks,
Vamshi Gajjela.


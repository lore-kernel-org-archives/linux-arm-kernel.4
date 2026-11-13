Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FDD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hw6ArT6B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUbIsGc0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=; b=hw6ArT6Bz4KFiK
	tI33fKsWyoDaixsKZGCUGFgV++gRIo+DYM+00TLmZueO8qren4T94LzuqDCfWmiuepMTqpwqAU9IU
	essv87sHAFSj6W+7UcCKHplSgVZZbzlwK6rBa9zQvUQaJ6HPpaDng/D2nzs64FQst6SLf9hsImQsp
	Rd4umhuiwxCc2RDEEbPTSX0odNXVuzQsyrDZmc8hXGIPA1fY9Q5M43S8nG+eMBqs90ktu7up45pGO
	425dXBuQWKEndiWL9+tixEMtSKf6Xz+WUM28PBAljiNCeII72EQ+x+Uf1pc8u6k/WWhU0xD8hLGL9
	SrZXCaHMdKWv0TZ8iapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgP0-0000000BSaY-1wZE;
	Fri, 13 Nov 2026 01:48:30 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgOx-0000000BSaD-4AZ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:48:29 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso431059e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794534505; cv=none;
        d=google.com; s=arc-20260327;
        b=gGsg/4p89/unCLdXBlwYifiOzrSvzdfT2lUtOEmeZTIquSQXLoT6M9aasHpGX3SJw/
         KuJzQ1Rfs1zgQsXiHdYNoVM6p7J51V+ivTlinojifCUcdhAA0cUGOucMYny055mlzBsp
         YIBTfpolUzeMyg4lMgw/Hb0+Q8B7+LHly4MrJ9wBtWSMYNXhuBNO8D5ymgCx54PrLFD9
         9smP3hJUH+mkAgyWOaZcRvZMkywFHaiSA3bweGS7JFKb9Bz3RfGK+dJfZ0xmEgdtsmTQ
         qBlqKmDyDFro7lgOen4MzvWgscX1j6B29ORgJ8jRdDtjPWFU8K+ntQ/5M/pqWJJaFDMx
         3+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        fh=9tZK59Q3LvsYuPCYJ96P8oVbwuh9xrleVt3LS0oXwaE=;
        b=U9Wu2D0YdcM1xTHLaqNIawQhoBnTCBA85Kux/O84gOxdxCNvpth+ktLh7lSvVNTU2U
         8nQRjngXmcsDNjDFGcmckmRls+Gidwi1ikmSa1jZiTIzhMKlzfXj5NaBY1io/OTCWTnQ
         afTnUqVhD+WRqB5m6fA3OW7NoMEmm1xX65AUbZgDSsAv54HJXhR0W6vHIpaRwOFdRxKu
         YQyq0uqZbFOacSizRZJb8wJXg9QKvP42mIYxq4DVMQ9BKvoBoaJToV7SoM7HMv/jrUHj
         D4MNVJVaQ6eMeazSZkQ7uJ5cS68b2T9cA4ZDPYomDMNvWldcetZsoJN5Nvlz6x5UUvxB
         5LTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794534505; x=1795139305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=UUbIsGc0bzjznO8+wTAgzWaeY2+l7oslLnkAXH1DSvxhoP8RnIDT/n5/1rLWDdCoGp
         7YoRg5xmvRUQFkjMsCbaoFzJAryMct4Y0rOZX4RLftmLsBOPfx3XvLKU5dL/GmB8/dcP
         MobQN2r+QFap4vid/Xb4R+5WQ7mJBo0oez88yJ/QN6ZQYrQCvq3U9HVsbyH6f0gVJWFa
         0xEcJEKtGAalXhMHUOSxWYgYM8D/OQJMtOGpMt3B/Be13RK0J1KRNjxBL3gf7P6PEKzS
         3jwLnQiwPQB2btOTRGZD7kpdfHB0HEeKNHo6nWhwxPaSKyHQ8Y6HsXIDVbZIHPdIPYex
         oaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534505; x=1795139305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=NT96nHAvX2aPj4F5+yunNoSnFy+tycfn3fMA3jJEIoQ8IzpHt429/X9uGPOD17sB3L
         gTdR61TahLWQ9zyomCizfgWqUS0CbQIQxAsn+E3ikFAnpJhNa7fvPveGlE3M5fQNWwFF
         jDHouCaZbLVsnC2iPquNGmEn9RUiVEgl+fH0FcynE5uPSAjUtTQgpDZU7n2VeBO4L6P/
         EoKhpAM1A+yqYkvC1OF5OZxOnJrZH3Z//JsToPPSuVEK9zT5n5xSYCCh7mswcb8dKp5H
         R2nR8yaIWqqIuMee6UgrCMjkQcd0IIUBa1uAxIkrarsAS2DPWHLrymGIt4cU5vBAl41K
         PrYg==
X-Forwarded-Encrypted: i=1; AL+hErEAdESTcpBdM6mVNqCQZLZTVA4eSmldwy4sRLh4aMyzI/1nFXthw8GZ9Fe9mf4Kebobc3oddmhZCZBSk+SPF/W2@lists.infradead.org
X-Gm-Message-State: APuU4Z/XRCzvm5RAK5Uw6eFJ3oWQpeHNLF2FDxmUgcd6JRHPGhK2ygQp
	VaZ4VlMGjeaKaWlBmLVsJN7Gh07fhHuHtFRCEkzqN+Sx2+XXULZ0J5ac9pZo/13DJ8orH/q6bQT
	xlTnzFUEBftQWzLF0lkICGpqHa+UvZ/I=
X-Gm-Gg: AYBFou2nA/op6UtzmCGf1SSmSsrAPrBMC7p50BP7ZsYjOVMjaV6vrYxRalY61GxjdQq
	aaxuPiwPPUD2v9raG1MwHn/3lrRJdm1g3I1XN0UIeY3b4jBEKsdW9BKVWqHzlS+xL3ygf+1+GgG
	Lw+hQHJXqsTtfUMqlUYTg9FfWNOroeacQsS4PpwjzQZ0I1inewTOXBmY/7trFE/3d0mkkypze6A
	QwhryUPdp/rJUpzIflIaKUzl/jODnRYX0uqPuFgLJ9HTFmzAZvjtT+dH9btRwoEh1RLcs9PbVAj
	byocm4Qb1Fp7+ExbXAJUv7KfbwW7TcIICjnM6++Nc9MAdblQDxIEcWp2k2YcpxECCrmDpWSnomk
	H1qm0TMU2PSimhlazafWcWpf7QLpG2T84a7kZizlOvznSpf7Z9OuGmsKUTWiGIm07v0jRFVJ6B5
	Q0i1sCR+GXg2yTmjhkUNNWDjST
X-Received: by 2002:a05:6512:1304:b0:5c1:5974:8a54 with SMTP id
 2adb3069b0e04-5c1705faa6emr444217e87.5.1794534504878; Thu, 12 Nov 2026
 17:48:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
 <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com> <avQV+8VrthWpKAWT@shlinux89>
In-Reply-To: <avQV+8VrthWpKAWT@shlinux89>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Nov 2026 22:48:12 -0300
X-Gm-Features: AclHuK_ZlsdyvAp9jZzuN6ezT2JMrw9zinFgseQFdkZHa41yGNMDULrPL8U4muA
Message-ID: <CAOMZO5D3JXGh4FbLs9hRmQMnV-RY65Aq0uosgk+zgv4naQGbBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_174828_052611_D01C8A90 
X-CRM114-Status: GOOD (  10.42  )
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

Hi Joy,

On Wed, Nov 11, 2026 at 4:10=E2=80=AFAM Joy Zou <joy.zou@oss.nxp.com> wrote=
:

> I kept the check as a defensive guard in case the match data table is
> modified incorrectly in the future. However, if you think this is
> unnecessarily defensive, I can remove it in the next revision.

If driver_override is used, then the check is important, so you can keep it


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6264606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P88fkpn8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqwxdULF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=; b=P88fkpn8IQe0VcF/YoiC8lQHa4
	ZWE9I17cYXdJUjgEx4SPLiLKzh1P7Pfn+8iYVivmy2D7ebJ7PJxYIkmaXMSy3XwLLxQOZ2plQHDVk
	X4e/nvQhOPmb3m6O1nnS6b4nO+CMpl83AKhwxT0nh8gpDsMbeB4r7DvcMhQgD5ZAr5D3j4r6WxzGM
	qnmPNPLwW2BxEsyUibM7ZPm13L0m3FWSD86A1Z7isqy4vPvUYhGn+vrcQpcd0nGGGHNnDKBrZc1kH
	wQxmcvodtb0bflUEgvF38gy91SBxFZ6O54dK3NWbuT5NyPfCpW8hKu6AKhGFadJC/cpscE+I+1rox
	qaghhlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCj8-00000009w7t-0qh2;
	Wed, 25 Nov 2026 13:07:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCj4-00000009w6k-3ogS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:07:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3696889f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612072; x=1796216872; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=xqwxdULFn+huKwu92RFFYNshScVxdkGlNj8Vi5uFqk/BOCJ/u2agxSHbPfQyjESqy8
         XWrPlf5+rJnvbu19wRFGgsbknatFGBL290UbZX34/7bCoDXOT69dFLoBXTjUKTcGeVZ3
         aosURJPKtIrza3QzddfiVB8sJu0QDiexM+Xju5uCtCSOONCijjM6stMLlXYt7jE7xgHM
         dUYs6cQgaNNperlUgvef2PEE354wna5m+TXPGE5ix8qAOy/1iGyp8OzlHlP1d59oNG4A
         iqsHZYctLxmWZwjHqZ19m2asKT3BvyaVUxgbd3Hgmra0ISW75lMt6A9uUMAg4S5HfXSC
         c9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612072; x=1796216872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=jvZRwP8wUBPkSgKu5518zf2prCUyRgHK7LLuOoCYUVE5EZyZo6VnZ1XoehcXciE02v
         A9yIVhERgINc9jQtGJr5tTdos2JORDYrE8ixEr8YA0HHa0a0oNhEABNkLW1s3Z+a9Of1
         IYN96V4u3+maI1ugq1NucSnJaB2Gq9jwxzh2+quFy6wK5ykpw5yBPjuJa66qOoIqbFYO
         DFYGkLP+8Jsj9l4VVrJEWGMq3JieZCFHInw2rAy/+h/zh1rDPDyYCvtgOaVDYdhltsfM
         ZlKy0i4QNHuSBblRVllAgn8X55RBo9cSAivkAytqfN0iKJ+B1BEiHKQj2W+d5+oqfBfp
         lHhg==
X-Forwarded-Encrypted: i=1; AL+hErEBjkM4usewDxLyTCK4KYRT1EWyVhWzSlqBZ5EWKKwROcFrX+BYphelGW/CXqPpaQHNQ0yYIaE8/N81ggqLkpZj@lists.infradead.org
X-Gm-Message-State: APuU4Z+iVVWHqCYuKloW4zKcSVPT6cj4qGNQRXhbpNAF0LEXg9q5Bsqf
	VMz3id/+sSDaDrqtAuYgJZdnmO8IhUnPHEEILkQZZJ6YErIT+vwiZMdF
X-Gm-Gg: AZFdTZfi4hCxIgHktAi+ibOPhDO47lYxIOFn7PvwVoc/f0iASjGDrvFuDO2nJpAIWpu
	CGrQDkQoUK7lcoT3V+4hgTJWSCrUH+yFpzrM/ERr2I1E5aasO5v7XANx24z5UTn4SrxG9p3imRO
	0RtAk3VRU69cuSZpyV2nunAeTXC7tbvPMBvYOR8ItdmDcBVy6uQitThxThhhz7NF08DT8xYMPKZ
	ZpwPTmJfCi3pySk5bK6HfUQNp4QneeWYyhy9bdzbWQjWru/ymI2C7v6bBZhmffVSwu3dWKdnaPS
	5NemG+1x0JIYyG7wSI45XeqgISkT6qUxUzWoxGcu0ZLEdZOboeoKKf0glag0T4fmnl2KeU3CEXk
	IVBduCuhXeh3LN+3s2ox4O+HV8KU+TTtBV83xzEnfHgrA4fULtyEGQ3rllwt96obIwWpukPOZ10
	IR3ZA2hD+4fGlO/K9i4OO0FeBb6C9CRlAePvpnlwU5fd5F+W1w1v2E7CQpqC4fB1I3l7Cel2XY0
	nIyMH/kH45otoybup4vHQwIbMZ1vuYLbhHTA9R5lgYw5H6975Y/hP67PNE/mFxXYjX/P+DKBzxa
	QhdYGkZHkDh3JEGxSnsjTC1Jn/XRVlWE1hWCu/IxgyWTYz3FCTPbb3Xx3u3KPBVw9HQnkFx3vqk
	Xv3naQ0hMAJTPahKmO9SKIqeH4tWg
X-Received: by 2002:a05:6000:2089:b0:4a8:647c:f963 with SMTP id ffacd0b85a97d-4abb964289amr35929140f8f.51.1795612071506;
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm33783108f8f.37.2026.11.25.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Message-ID: <4ed7e2e27c221ab900b1562c2a578b78c3c663b7.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Nov 2026 14:07:50 +0100
In-Reply-To: <179560526391.84329.2026344704407829230.b4-review@b4>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
	 <20261123092244.1792040-3-virag.david003@gmail.com>
	 <179560526391.84329.2026344704407829230.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_050754_997985_38D7DDA0 
X-CRM114-Status: GOOD (  12.73  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-25 at 12:14 +0100, Krzysztof Kozlowski wrote:
[...]
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > index 8af0143c3e47..f62e3ed82257 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > @@ -24,6 +24,9 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos8890-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos7-dwusb3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos7885-dwusb3
>=20
> Why isn't this enum with the other entry?

I failed to realize that that could be done while rebasing the patches
onto the current tree (as 990 compatible wasn't there before).
Fixing it in v3.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos850-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos990-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos850-dwusb3
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
David


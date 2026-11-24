Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD112606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IIuYrURl;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=az39PJXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JM9ysjSB6I4rFtLJdz+KqPCwsdK5iSF6mh6/I4gQwhU=; b=IIuYrURlbL+DU9
	Iaa4VCn4xYbmfz0sSxif6PHCKxe9p+VYkkbh/3ss6NQLft3kw92DY0wCvyErEa0K04WgJxUJiVjuS
	bwa/6XtVcIqP21FiHxQGRxTXnNVr0gXmjFCA6wxMNlp0Ptm4ETihgu3cu4XXaMdbBYBkaDDU+9YJE
	S42qTRAvFn3J4xeqVvWvKWF55Uno4fxk94TeqiCNM71XPhEyDe2cEprXV9AuWw3rIEMCYjW9zFLHi
	GvWNAaPUmxmjl9d8s+UBfCtZWZAxAAahU1L5+3leW4oRpABFJoPJMKGdMEyTYWkpihXqJkPQEBDDo
	qMKTr7mCBj6pz2N85MUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVy9w-00000007sd3-3xkb;
	Tue, 24 Nov 2026 21:34:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVy9t-00000007sc0-2UXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:34:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3258245f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556075; cv=none;
        d=google.com; s=arc-20260327;
        b=OA6dGP57/xzU3koKYWPBtNPTGvLWUZfR2ClR4qEzwvQ90z8sWvFaMzptZq7CjepM+S
         0HwYtmH0rReyXOPtKylvZe/pcSMVgjS6QfQkOgzExlk/TPBQ+jCEUVJaM8KTRF7StQt7
         pxbBa+6sisUsAKSx1BFnkB4AkgB9lQ4SwCLYMjMyG9n0pupS8sZGlTsXDvtyqLoXXoxq
         EUOJy87dz9HM/WrSYWOOZHzxSvppe04O3AA7qlowadsKgtvWqix658waoScJ1odQi14S
         iaIvd3fhPKvklwNmBHsX71UyNR8GFo6aqeTz7nFgM0wNwFC5FMyjK3+QpFayPGtJ5Yhx
         FUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JM9ysjSB6I4rFtLJdz+KqPCwsdK5iSF6mh6/I4gQwhU=;
        fh=o9EryvUtRwJZC5hUFIN5TElzCTUdKCAyY17tDBBrASQ=;
        b=b6Yz2PjhIi9RFARM0eB09uFP3p0+zeDr37iGwsrhHa/cDATDLy6zV08MkUjkL27syT
         IalDPFim3jlP0svGx53D+e2duEnYZWBtfOHPnoqretA3VAAyHrPTkSUUkp/AUDun91AX
         Z6cFFoC0KcK+vkpoTiaOwrtXTRzaBBiKYyGeL7vCywoX9iNua9WyRp6TfJo+YaZbVHI5
         qEE5wLV8JwFXDdd//NmTtQNY6jI8W5kYEFmEZjQavtAxU8682X5HrkfmDefdJRshKlJt
         +Ce2Aw9Bjf9ZgksFmU1s+IbnrzkYEdZevm/LEBP5X6ezzZX37chhjfEsB3rMtAd427BM
         D+Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795556075; x=1796160875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JM9ysjSB6I4rFtLJdz+KqPCwsdK5iSF6mh6/I4gQwhU=;
        b=az39PJXe2BWeV+bwL0r2hGuX0i6MZbB9DwD05GzEWpa0F8Y9qycOtwwrQfbf7G49Ft
         AUP/J+I3AnmmEJ6Oq4YNBLbpeWLTDObl/LOPveL+wdG6qVvS8WT583lAwX+1aPz+DdN3
         pJZeMzZ/iIWA0cNHM7raLgEcxiTB3bA2vs8UzpZbVJz2sG0SeOI9G7XfpqKQefKVqktP
         zycYvY01AfPd60zq+W6uh0L6EsRtBmWBTRGgXf/4VDdlP0BBSTZiRc4Uhs3jzuaZ6Cv4
         rA1E0/C3VsPifRusKN7nfRUQsZ1+DnthNFljhiQo1HGL1lJwUS1Xj5SN0zyznV0iiy6O
         /fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556075; x=1796160875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JM9ysjSB6I4rFtLJdz+KqPCwsdK5iSF6mh6/I4gQwhU=;
        b=sqbLUzWA1OKXzg8sTWzf8uoGuR7yiSG7/bu3vSeYmlJ47sgfuGBQqymygJ8ukr3ReF
         XFTCTj//Fg8DzdZmvoPn/git0uf9JEKVl4JqRq0SVVoyt0hVKfaEfw5mI6oIV6cTMCib
         9CauWMOWUNoGqKfZT+iDcQApbNtjV5sGydV0EIKOzTFPhj3ivQ/Gv0o38Yg+JlULrBrX
         FTJ3pZShOGfT8RUs2YbCz84R8U4mOaUWYCUViTiUEt+zav4GytuvAUR2nmVw67iSEzVA
         MVtYkLehBTWqVe6mrz/4O0si88LaMDbdVeqW4ROOK9TK/6VzCvHC0GxLWmyfRnXxPKco
         87uA==
X-Gm-Message-State: APuU4Z85jO61s09vlQB8AsDGRoHzYq24DjSZORtRJYE10ChVPv66OIe4
	PxSKRxiPleDYcVoHfDZhhj3llEjjGcn7ziEwkjYzf+KALmgIzuNBVQLSp1f0OE4rwrUmdQMkSHM
	xxYAQlijfu8LPLAT1ToPRUgMXHFq7LmVFjTKLmK9X
X-Gm-Gg: AZFdTZfN0TpSmyXvFM6I68VIHRsWN91OFJ/6Lvk2JI3kDd9ALQLElbiEDA2l8luPUwW
	W3z6jXojSqmB5Jmp4XbdySvQohpJ7sTNnwW+45t40/glzjJyvOpVmVLAIwsGY2mHFRNezwx+gpZ
	43gzNXTB6PvGitGdV6ddywQ9iaMx7/ylyMQJO6OzlzLrS80OoZAMJxT+nEIiQ9InNxdzDk0OKAC
	mh/2xmDYC+OV+ciz+ddxNuMGoaXi0fGYlWtsTrC7YnCdEiNg+8IC8rlBJ/P8l/ccyDkUkHu8r3b
	I3j8J2njAU7V6eiyXjWM+ZW+VxMb5auRAbCgOwdnLhR5CiPFjjHqLIy9AhmMvREQPjORIheYssd
	mKpWCadHfrEiDcRQ9oVljRKwGhOEG2nygr3piBGinuFACfLPUts9lBY2K0OMd4ok2L+8oWsgeVH
	bUmDNIKI34HVmrsRynOUnLb2HNVQ145Rf61OyWdaK3TAWJQp/6PzR1UxXc7EG6ukvFN9Gl13kEm
	aenMtQ3Ims1NdIY7XkIG3tpEO+kmtM8lFSYiw==
X-Received: by 2002:a5d:5f42:0:b0:4a3:8b21:51c1 with SMTP id
 ffacd0b85a97d-4abb9de7e00mr31966438f8f.53.1795556075130; Tue, 24 Nov 2026
 13:34:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <20261119165825.1793558-7-ardb+git@google.com>
In-Reply-To: <20261119165825.1793558-7-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 13:34:24 -0800
X-Gm-Features: Aa3M54p2Urof8ODavBAwbeoqCfIEQBvqotg8Xr0UbH-8_2IQTFBIFEvoHhfBKvE
Message-ID: <CAKwvOdkU0PuUp-AT57SOPJtSbsJXz-YR6TOh4LcMn9hVTcSYPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Re-enable kernel BTI for compatible linkers
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133437_667226_EDCD1C0B 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The compiler is permitted to omit BTI landing pads from static functions
> that never have their address taken, but are only called directly, even
> if those calls originate from other code sections. This causes problems
> for calls from .init.text into .text if those sections are placed far
> apart, as veneers involving indirect calls will be used in that case.
>
> Now that .text and .init.text are combined,

in modules

> this can no longer happen,

--=20
Thanks,
~Nick Desaulniers


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FMm6tVb4;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=uQ8AM8JJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=; b=FMm6tVb4dq7l5L
	ZJi45ONO1JpJl7N3x1ytKoc2NC4SiCkkQDkYfKPe3RcdO4znYS6+J2iGEmNh53jR6hxvhwSWHIjnb
	aQ9w/sV3dPAtFYKj7T93h107WscuXmAwIXnfqNQO/5WC8Os+XwscLT5m+ZvC7th/MZWqS7Bjyxugy
	O7eXjy840kbEN+X0gjQms6bfsFMcYTxu1NF4PXTi2w/y6UovsX7qZ/Hi+WlKYH6c9D9cHmSj3MlWT
	R4n9LTnSde6HkTl9K1wvTLQ2b5MfpTzIFfFmYi2XYbGnDZbol+cKXZcdKVitVRffPtJcI4b2qOF5Z
	j4YaYhUgNHLni3BUO/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDT1-0000000A4Se-4Afi;
	Wed, 25 Nov 2026 13:55:23 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDSx-0000000A4QS-2ckv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:55:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1112137866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614916; cv=none;
        d=google.com; s=arc-20260327;
        b=Q0OAS9ZcceAkzNL1RBZn17sT9ORGFpyQOGl6Jkf07SytWRZJhOxg7eQbqCF9LGul8p
         098vLdRS+nBt+miqpV2diHfpG8+oJrIwTmMiySf5Uh05sGRoXK1y28dk8fRik1Q2js3Y
         2ywYWHXZgySoZjup0quA0XFcMBoazDM69w4jES5qAeDBYfelZr/z6ZzlfOGcjggz87Tw
         kmsoS4zcorLtyAPp9AaEK8/PJGBDvAbP+CO+nBlLpKZDtw6zNFJCL2+UMczZiC3HVMNe
         2nOgYOtjhSDp8A1vx0DJQGTU9G7uN2kbe4N+23Pv5I2otz8Tz8yxXTEGWBL8Z3au9Qxe
         Xn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        fh=InJXnLgfCGNX6nKrHQeWEzQ7EbX8Z27t78fRAy+GowU=;
        b=PJmM+qwrcQMh6j7i5I/NhQHv5xUM9L6zwPsUaMJ44xzjL+bN/r8PS2Ee31fOkZxU+9
         GSMTjhIhah6jqTQaexeVEoubAxTPYDsCUu3zFIDBE1f1ywG9uAF5HLuLMxOycwIevJ3u
         emRseCHn+5XNR3I4TkH9WQKquhGw+kplcE01xEZOlXfRpEQLl5FNTPWhQSvaL+cEFL3b
         KIjf8d9gLA64Q+MKYD+sgqYAB3evMKOreSJyq8P2FuQoJ2bzvnFP2AUfwnw8fCbXzHaK
         fhvYZgjUq62whqzHdukWnxxD6ftH5CB9Soet2H1zXn12E7EToWlMrWSajj1w5C12wFGO
         veTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795614916; x=1796219716; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=uQ8AM8JJt5iQo3kBaghdvbpgKev28iXkGyV6tKgj5kalKQmQI3sW9pJtJx47Pm1q/q
         MvyTZMNPVn8/yvVdYbXP9mXttsocHADhWNbNAfyRWd1IMtwLVLFBZ56/7oJ58KBABsX7
         PDbLLsZ0xwGhag5QLQgFPYWCqUt4qjniYbVUDz3bzasg4f8x1m10aoTXVKocpZ+kQlVr
         wfHJVrQY//SMP0564O2TyeOrw++l+NfJVnZ8gor9Gq8mUq7YYZf5rwUUWfUCQU9Ta0nC
         fu94fX0xzpjEViO8Im37QvdRkofLEtWMX/pSY3olSC51x23TA7eIEgB5JtuvnC55ATvl
         5K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614916; x=1796219716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=fvtltyGRSIw/4/kuacgSi0Scj+7gU6d7qOdj6r5xXhQRmVx83wYoImBTPczjhaKiIV
         N7Vq7cZjJt+9YeWzTR9lfcPS/59oe9k2e9F5S193KHyGvkY0O9guPgEL5LS86c+JOIM/
         rA7GkzaxwAiQG753xwQpQnMOrfyMgWDcRM7ydf5+afM4LrUAcFDtmn/asx096zGzr43M
         n8ImN+cyex98faHTyzie1tu8nIje5yral460y+0fl+iEAln5GPMS1NddcvCmOgraIAxX
         TrJtliZotxmEOXocPfK7Uz6EBsNmgd3zpgpESgvKjAIjtY/SzWrOMJZAvFkHUXAFW65S
         GaDw==
X-Forwarded-Encrypted: i=1; AL+hErHjw9H/HdSYNFhdOp0o9mnh/9W0CxyG1niCPCZcJCO+uCgu5a//QlCq9YriG1QHpXS/u9C8Rya3U0YRY3CpD0On@lists.infradead.org
X-Gm-Message-State: APuU4Z+FeCYQiUeVkZVj82sB/Tq1W4N1Nub6M+TWOeGXoN06hlSDHk+q
	T6GiSguQD464a6JBQA6Ndc+/JalnMldZYzyqw/O1LnV97+SjhG5WiussyC9tnRCmk0uolsl15U4
	JE+SXbWP1Iz87FBFxt1ZWwRDJwYQXfpoNilq+0htByQ==
X-Gm-Gg: AZFdTZcxXKHuoPDTFFsQWZek3jNDxFtRyV4qEfRX+4pwMFXtbN3Tku2m/Oh8orwUIcv
	n9FViEg2q44GHN7H47pOcDwYuIrsydhBW2Ou+BXGlSwckwfMp1MaWa6zCM+D+GaUzYt4MHL684U
	MA+PTaN+Y9eU39rbRzbmU8xK+HtG54Fa30T/6wvsi3nt2OSqraE0Be4TLE0LEPA5VxSYpLa7suA
	E0rrrfZP7/l6NaQ5zC4kfLsf2KgwuT9J6fSziIOkgYciQpzFzBLxKkyi4Qffx4oMu/AqsLnGL82
	K9kEI1acNm2JTOI9D1/OCPdylFLUqIWlek2u7liSfSt6c5koiQz6t1Icdz0eWupvvAyId0v5hjA
	dl+h9Nb72MCiGY1qySx+4CE0flzB+TtdhwGKzcMJGif9NkILzT4pyUw==
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id
 a640c23a62f3a-c5150c98208mr1275142566b.10.1795614916108; Wed, 25 Nov 2026
 05:55:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net> <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 17:55:04 +0400
X-Gm-Features: Aa3M54pv9ze0w4z1urAY277TKJgQi-9HwT3ngn04WBh3FoiAC5gcBe50J9g0GsQ
Message-ID: <CAKTNdwFwuG9bWStnuttiXY0o_iqMX3Eu_0DhFtxXt09Bp3Dz4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055519_690905_24DF2446 
X-CRM114-Status: GOOD (  19.79  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

On Wed, Nov 25, 2026 at 5:49=E2=80=AFPM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipp=
er.net> wrote:
>
> > Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> > ID in the OTP memory and patch them into the device tree they pass on.
> > Kernels started any other way, e.g. straight from the SPL in Falcon
> > mode, end up with random addresses which change on every boot, even
> > though the CPU ID is just as readable from Linux.
> >
> > Implement the derivation for cells marked as "rockchip,cpuid", handing
> > the result to consumers which ask for the cell as "mac-address", such a=
s
> > of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> > so that the same cell keeps serving the ID itself.
[...]
>
> Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

I deliberately avoided that because, at the hardware level, the OTP
cell contains a CPUID, not an address. The special treatment applies
only when the CPUID is used for MAC address derivation - which IMO is
better captured in the binding description. Let's see what the
maintainers have to say though.

> Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S
>
> I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the M=
AC address was exactly as expected.

Thanks a lot for testing!

Best regards,
Alexey


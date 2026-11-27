Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99785606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M9pgaYh5;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HEGYCy1u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=; b=M9pgaYh5oxt7tB
	xCp9JpVfY49urshDyxdfTpKftnZqspSprtqgxrpjGf5u0L/D8Mdm0xX9leHA3cQSP37S0CiypTR6S
	megKM3ir3mGish5QW9aMG4KSdp6XpbENicOURIYSjUnbJWjrwI0MD5TzGFBp/xrDVw0GbJhWFNZzK
	VMUcwpWnLJhYqetxYrYSPRRQw9C4DV//OYPoUx++6CqVO7x1tVpupR1f6v4dalsVzdpuUFJbpwrel
	P9Js+ZOCDRSu5JBDrLPR5pDmOMnJUX5N/T3Y0chVN0UdoRtnK5jROIypfnaQZSKVn2M590rYWIb4K
	JWBFHeAJAhNQn944bVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu8A-0000000Fo1d-31Hb;
	Fri, 27 Nov 2026 11:28:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu7y-0000000FnyB-3aQE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:28:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c51c294cef6so176752166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795778909; x=1796383709; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=HEGYCy1uD+27hsRvHgZbO64GrTY+wLwyA4lYPGv+ks4Z4aDbT+zihObT1EI/IIN5kZ
         nR+LBTr8lTC5ZBgXts6yLxQ3HPEKICw3m1Uoqrf9n7C3kpjq4MYIvjDeAUJ5OjmTFznM
         XZWFEnEPIOd4JciREzMU8+ConqMoBO+FSNeekQJJiv13YPKCYy35EMlOkJIrU1PasYo5
         U/eqSHH5nJJXnsLKIDr51+z12JcFueDmSlJnqncxspoiXNk9uCSdseuNB/LKiMR5RG5M
         FaRQEeROLdqQIjFsi7NRYl+sw9SZN9daDvUJKZsr2WkPww9T9bhvy/e1q39/ZFifiJXg
         60ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778909; x=1796383709;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=E2icK7I7+NDiXJ6czoZz5Zq9VanCeZJM/0FoYy9PY8bM9LoJ6PAtmf6Vez9VJ0CbU9
         9ec1x02nvgrE9riCF6cBHZ7moRjw0cFB255GUPXjbcOAtK/+z8iI0FBbCM6n2lzjow6t
         DgeMUfabAxaOJllpLF3I7UgcrqC/oTF+aZ+D89M0TKTaKz7TwTg6pbjrTjPdpVdmagOG
         r8STVY3VfPKPGs4oeiwKNO3kwXam1AtvECvdzgqGtjxE5j6kwkwAO4xR37ypBUPVmpn2
         SsV1EaRiXGAn0m3bsQDbDQKbB0Vy1NxXVZUUuxpDctDcu/eveRfNJYAlXHzJYoNRGXGw
         z40A==
X-Forwarded-Encrypted: i=1; AL+hErECVDWFW2rmyJV6lGn0RjuKnF59fOxwwj53Ij2L6eg6jx9V2dg28Fo78nNYc6CFSb+/BosQ1S9IMzawt1hy7C7O@lists.infradead.org
X-Gm-Message-State: APuU4Z/YY+UZ9pC3sdQ5E/NvWNE4OibvJZaDyP6rGTNKpbRvjktpfuY1
	tlI+WT0cbMdbEJVPGqwCRNPDfGYeanZD9CxYqrm8xOtp4vgQ1rWRmDPa+jqzPjIdEHc=
X-Gm-Gg: AZFdTZcRfQuxzuL5/LcjGm9kCY8BSl+wmG4QUUFw79Ivx5W/FFyirRQp14IheuQQLnE
	NEB8DDWYSbEfJ02BKXVrPM7kdqCucgHqwfiYNK9tCP7sydn4UOmk6h8HWnMBscbeZmWTSPMLBCM
	o19woM6I4dIDVeSPikKkGoVhlKDyDMtAljz3C2nrQEF/LA/nJMmhZGX3M5lwjN5yGJ3PmnCfqTI
	SLursLjbWQhVI1/FyCbQFXqlbtchG5Cwx9lQTM9JEkYvnIbCnOMQRMROVf9O+sGMabM2FLSPmod
	ovRztlLSB+DjCrCpwM5b/gNIwl0XvDaTUxZGc6yb6XtQ38Gq5QLo2Huglb9s5pUWRM61pYowtku
	R/RZNmgtANOhln6kj8KilMupWFhJ2e9ZVBXQceaOZ45dcHWaq8CKPYcNF/D7MiYbAg2z6m21FOB
	iNnRItD4imDEKLDw8ICa6W4DzpGddvqklp2G1Wc1GfD6Xp1WERVrr+g7AOMIUeSoUOdhZJGRyGQ
	htHDzFmEfEB5hRJ0HmoKScphG6iAH2dJJa/YaqETzaOczNIyPUsiqN6DUpkrsnU7+LAQa2ZTuux
	0Al1qCVN7vakQYLHTXNYb5p62MyVbNzP+iOCcaJW0z2mQkFL
X-Received: by 2002:a17:907:3cc5:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c513aace8bbmr1830615466b.9.1795778909013;
        Fri, 27 Nov 2026 03:28:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm851858666b.45.2026.11.27.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:28:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
In-Reply-To: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Date: Fri, 27 Nov 2026 12:28:27 +0100
Message-ID: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_032830_930571_26E7E783 
X-CRM114-Status: GOOD (  13.56  )
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

On ven. 27 nov. 2026 at 05:29, Jernej =C5=A0krabec <jernej.skrabec@gmail.co=
m> wrote:

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible =3D "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>
> That's not really the case, is it? A733 emmc has support for voltage swit=
ching,
> so regulator should be added here for voltage switching.
>
> I suggest that you drop this node until proper adjustment is made.

I'm not sure what you mean here. AFAICT in the documentations, the D1
and A733 provide the same registers and should be compatible. They are
so far.

The driver does not implement CMD11 but this equally applicatble to D1,
isn't it ?

What we might be lacking right now is properly voltage selector on PORT F.

>
> Best regards,
> Jernej
>

--=20
Jerome


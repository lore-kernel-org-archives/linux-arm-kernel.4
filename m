Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB045606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7haNkQx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOABFOKt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=; b=U7haNkQxO0DIx0PIkyGfaN0Pt/
	RXu8x4XD3BWG+yXq+r1DbRapuW5Arca3IQmkKeMwuN1urj5eN2NrqYBn85J2iToxQj3kX3JSOBgXA
	NuzXyqCO6MrwbL4TDi7lfqo6qJpAIeYHg94RTWCdPUcifqxUKLai1Xpos2qI76sxlJmBl6pBK45ME
	A2QHbYyAjJZDx9A7MQaLG9tWm/77mmE6hvSjXX92DJiocWqDRzolX2RGdtfJhJn7dHHJcUmk0gOOC
	O5cxB0sTa1i2pWDVwFt3jjPmWWR5TEw66+9Wiek5U8suRK6spvOrNIjE3uP8twkK40nn9mj4FuQ7j
	3htS+V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVylb-00000007yHm-3E5u;
	Tue, 24 Nov 2026 22:13:35 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVylZ-00000007yH4-2vZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:13:35 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67da69e7c31so5461761d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795558412; x=1796163212; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=;
        b=nOABFOKtwpbLtnW9DyQXIW0yIegfnpuXlj/7/8GfQZLUXJLVSuPrGcIYiPK32RDiez
         nZJfmgXOdoGmSMzhPbb4dKq4SDGhbmxBIZ0ppNbXVR/CEgyywpYUTK/aR/xcESyDO8sV
         jRRZZr+76Pj34nql0xLVma6L89Ik7zL9wa1FZV/yxSYlKw1RXfD+S92RmDLVTBCsByh4
         PLecI24HMrjqspwnnpB2eW5ejr6+T9D20c7+PA22L/fJ2dbpp51rzEZhkmPs0CPymM+S
         pNy/8JS4waAR0Xn9qvjw6CN3hyDdg4KmEoRVNu9/tlJ31b8UnlrqaI3jXNn/KlaDB9VI
         0a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558412; x=1796163212;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFcGsqmfmZRkt05qBK9du4hRMwTvxalV5t9KfsrqdEM=;
        b=0n3KZoSrsLYLrQV8rmebY9Lo8jua6duitNbWzUkg4P5YZ/DvU74pkyuWBY3AbcGFbO
         Og//d/kLWqBGGf4TnEGH9137HKW5OffdmYO7I2e2dX7CtqWEEAiHJihjVXpVSZKe6Sw5
         /KkcKwzsBrByQ0uuD4PYwmT83HCKsquJbnMcqvSUFrbXy+3JVB1sheqXnjSRAaQeKFW6
         L+a3f8IKgaw2t4cw58+HNfzl3nz4fw262XW+oNBE6Ch4H3VpGLN1uYpYCmknMb6KI33s
         IO0BUrR337u8E4gSUcGlYuaAjRUmm7w2RB7BRIMC2nOPnr0pZJ7lQ+ti3MvvXZvBTjCA
         1bww==
X-Forwarded-Encrypted: i=1; AL+hErH6sFsGLXaCYMH9jYUd5b7W9ZtuESjmRvpazp9jGAKzaslpOo/ygBW+TCS+htMzGllbQTswDI49f+DUs9C0kbz5@lists.infradead.org
X-Gm-Message-State: APuU4Z/4jIvIbyrTExoKXe1hIPY14u3xtrI/80kCQpjIOrjfHES89lem
	VeBgo2z0aqwaLMqxTUprw2zYsWbevu5Lri9/Ov5tc+MyX+ys7wG/ixbp
X-Gm-Gg: AZFdTZfeBsSbOYoz82sIx4rsnotFu5XUN7jz904RTzmfCI7U3b4X5FINaSPiM26+yVP
	B/eetM7MTjHiBbTxdcOMqigpwdbkY9/RjZQIbg6boocEJYeBXiBHEmv20ejBmnQQ+XjF/3g3sl5
	8wbzjZWbrzye6LlQ/T4hzgEyULTsoim2VSe1+q//UQYstJGsCQUCSFCW9F5sWPRWzmfuofrrlsx
	T84ZRRL5lWZ1eWbGeqMY9ePZGidBBL5eIFc5yGNE3RIT5a3WWsJCpwbB+s1sP5CSnRWiptalfSW
	j73cVgTrOxyHF5WwD9KflO1tWQ0wXXjTWs51GtDSJ2AgmwyGFN28g0AhU9CA8QQVYqbY/MZttn/
	NNHk4s2HSHWqPtulUrSXaQa8G/fusZ2ewVj4pULoGjm79meC9LdKRoVeYuxE58QHuaMZ9S6rsSr
	1l8gVIH0j4h2AwL+i5p7yExGoD6U0fXVVv7z9QzYGfw4pitvNng3dAjeYMBNZ1W2HWStT55XpP3
	VBbJwiAU8oJMkIfkoeT7uaqfZAvSX5QQK0XxFwQNtmsX5pRQg09aXE6R3x2aWDPDu97X4uP0XZ3
	uwprZBM5qP2Mt6WCWszQqso7OyGeaMIknA==
X-Received: by 2002:a53:ac90:0:b0:67d:c14c:9f8e with SMTP id 956f58d0204a3-67df4410ca0mr6821449d50.32.1795558411857;
        Tue, 24 Nov 2026 14:13:31 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df30e4407sm7857086d50.0.2026.11.24.14.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:13:30 -0800 (PST)
Message-ID: <834c266a-eb07-4427-b1fa-5c6508a5ce32@gmail.com>
Date: Tue, 24 Nov 2026 17:13:15 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
 <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HRJ667nozFI7pDuLiKLXtKsh"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_141333_769097_10B3A66A 
X-CRM114-Status: GOOD (  15.11  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HRJ667nozFI7pDuLiKLXtKsh
Content-Type: multipart/mixed; boundary="------------lc9NsThzkDEG0rUbHzJI36Wt";
 protected-headers="v1"; hp="clear"
Message-ID: <834c266a-eb07-4427-b1fa-5c6508a5ce32@gmail.com>
Date: Tue, 24 Nov 2026 17:13:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Eneas U de Queiroz <cotequeiroz@gmail.com>,
 Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, brgl@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
 <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <9faa6fce-594f-4556-b5ab-6aa73330da8d@kernel.org>

--------------lc9NsThzkDEG0rUbHzJI36Wt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/21/26 7:22 AM, Krzysztof Kozlowski wrote:
> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
>> Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driv=
er
>> for this IP is being split into a smaller core stub that doesn't regis=
ter
>> the crypto algorithms on its own AND an auxiliary driver than handles
>=20
> This part is fine...
>=20
>> the crypto part. Update the arm64 defconfig to only build the core par=
t
>> by default and leave the choice of building the crypto part to the use=
r.
>=20
> but here you miss answer why. We do want the proper driver, not only th=
e
> stub, no?
>=20
> Best regards,
> Krzysztof

Most users don't want to use the Qualcomm Crypto Engine.  It is
significantly slower than the CPU, its driver has a history of bugs,
and operations that don't meet certain fairly arbitrary constraints
fall back to software anyway.  However, most users _do_ want to allow
the interconnect to power down, which is what the stub driver does.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------lc9NsThzkDEG0rUbHzJI36Wt--

--------------HRJ667nozFI7pDuLiKLXtKsh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmsGDAYACgkQszaHOrMp
8lNsng/+NMmecEwic70Ntrxi+PaLjYhERE/2Y0pncM9FfvCEV88uvNtEmnzf5s03
qwbguuFGvVa3220G3VvmAWRtz5ai/nL4yZzT28GuBmD5WyMgrbpHJ+/ovO6Mzrc7
y3uA/joBKmD3/Mornqp6id/EN15XlHnRZTO7cYZBELp+VJhdMGnQ3pu1Iiq4GhBx
bdcLrTAJvkUG2DPvozkBz+xOmsnTsGmljviZD37JimbQ9NRh/pxHO+5HzJNEqNen
3ee/o1i7BN9ThwxKyOSUWVrVdxhep0StfCc83+ickZIVtC3cR54zy7FToQlsKIRJ
VioxblgFtBTI7i0JgGo2VaCWSR2sy6w0twJSeb+6fyQYOPcjRyoOvqEBzOeysvPc
LD+pqC94Tvbka4UPtBZXMuX574qkrfy4ELlGcqtdGF3rGqvTMlZSuR9Z3Wr4607v
j1yibCVtrkWhl1QWHh7PhITv73Lxy3ZHOj084OL5CQhREGE+xlqSGqnzs9nKlhoM
sZ3f4IbI9yu05BdRt7+k+k6XjuiAd6LosIIzgSFqROoi1M8SlGtuhCWCF6j4i7vc
tQUP1SMlNvblhXonfqD3OH9fuR2epqGn6QgpRmvgB81utzhjwt6U+rzi3+iX/HO+
siMLhb/S1P7Qrd1Me4R0a79ixD2BUt2uTtlO/jqMw9N9q8wc2bY=
=O1EQ
-----END PGP SIGNATURE-----

--------------HRJ667nozFI7pDuLiKLXtKsh--


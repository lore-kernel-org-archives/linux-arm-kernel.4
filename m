Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001DA606B2E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WjJxKuyB;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g+WjvQyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fCpK1V1D0Qc4NVcwIhFFojyHQLcyReT67X6u0KnmZoA=; b=WjJxKuyBTd+1lDNx24V6L61r/2
	kcJ+8++9BPdEXTWVlfDQrV3jYuwsbVdYQODQU6wbC+W+CG++6ihmgJLm3zwqgN9v894PqF9awmXdB
	EPcdnpuKMsZ/h3apzDwhXeEYp95+nKAXkO/Qsf8vei7uxf10XSBv35ZCf7ErqsXM110YE68w3Kq1H
	AP2ZNjk54Q2ZPsMJueXb7t6lD8Fbodfpo0Yx2CBfuJebFMLU40mF3xYQRppILTawT4e4IRQenTEWU
	j5Zx4SLclqxh+KxNoN1OPUO9vh/wjtBCgNTwpPesInMP+dYLkTuu6RGpDS0C7tQDzVJR09hTbyls7
	F+3cduLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwUo-0000000E3lR-0ROq;
	Fri, 13 Nov 2026 18:59:34 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwUZ-0000000E3eb-3eI8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:59:33 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso693611a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596357; x=1795201157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fCpK1V1D0Qc4NVcwIhFFojyHQLcyReT67X6u0KnmZoA=;
        b=RfrcPBL9Uo9cp4T3/U1T2FfEK3OgWm8BUg67B7hBnSg+bo0xpl8OkElHyKRVOUNaNb
         3Qacl5VCFllTUMznPXKktb6QmFICApyWehIH8GitfbaXGl6ZAKst9xUdWhYr97cQOuzC
         HsykUsoxcbmd20MwUmoA2W2fro5p9NnmV90gPp/5MXyfx1fbQMXXrJTJmrnxoFrPCB9V
         EFiPrhASI+3d2t34UhwDQJADbJNIybmJC9XHFlf7NXG8tWwoBcAoE5X52/59rhrmek9c
         iwP5xO6PlNpLHa3XjIXesKtTt+uxkX/wnwSud3TNwCZWdaEFtkCVELM8c1+dJZi+8J6q
         WfVA==
X-Forwarded-Encrypted: i=1; AL+hErHQyMLbfKbhk5VKubMmKY07wwlMCKIrhKU3jFDGphp3S9rykr0t+rc5fM2Vp7jUSzM9eLX4gzJ1JtIh45YdYJNL@lists.infradead.org
X-Gm-Message-State: APuU4Z8lkf1uThLc9eCceyviFkJ+cWdmgbIwdehaQoVlAYlQp3CwXZfW
	KFCfFt3cG4J3ZHpQbQcCDFBUCimYAW9g+3t0rbLQhz0QgbQM7cN/qVofCo2eSjPlwM0RY2juVp8
	KKXCwJZ7qoHmn6j9y/cDTjrlHs+AUsXZsj5QLDIABhbSWwlGu4amGpBL4Tnu+CzvKGgw5ql0zMV
	xsHge9Xgce5hL/7kHvW1VMm9kO19ybdKga1rM8NMKnsAb+UTPNsWLwvqidmEE3qpL5B+EWcwlSf
	AJg8XKFk18DPOTtwufIpM4=
X-Gm-Gg: AYBFou0zm4MchfSe6iuGjbtOsjmBT8vVsldL19NRv2AvB+9YgCxHIR8R6mkEUERB1m0
	K2FmEFiZR0FN+nH/612mDWZDqHwfKjhfmHryGfESgM05KeudvMyDgDnjoZ00ZN/SqDGytcSLOpe
	It5zMd6r0owdlZ0vV8rS9SU65uaYcS2/TdAQAnd27vi7Ga+nYbvi8q7IubwbVID6+fvwGn7OucV
	jcnfioCq66KKKxgSlQxmSTBI0LaDo+ZMskzas/PBVnKE95Gsn+5pGvsISOC1/ESyk4b1OdS6wZH
	y+Gy2sFl5TOyU6EPTsjltw09M7uA63u8RcdINmwDxgzER8IzAZfglj+PFLQJteHdVUTyrM4QTOM
	j5JsaP2IqJGxjIFwZPTO9KzP04GbJCBzen0JZHtQUKu3vlVspPIHUZH0YSBCOYpCMDb973+G7vK
	vh/CDqWUYW10ysTYeL7GpMGrJNS3aGT0M=
X-Received: by 2002:a17:90b:1807:b0:3aa:fdad:7d6c with SMTP id 98e67ed59e1d1-3b1b0ca59a4mr3203387a91.58.1794596356689;
        Fri, 13 Nov 2026 10:59:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3c0a5a8sm2144009a91.2.2026.11.13.10.59.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:59:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5383c05fb2fso18317951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794596355; x=1795201155; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCpK1V1D0Qc4NVcwIhFFojyHQLcyReT67X6u0KnmZoA=;
        b=g+WjvQyLKmZywi6125lVz8LUjNS0hsMp5ltl86UQke9DCgkyPxmzLJ4i+m86a9opD1
         TjcsTKrFkCXB3vGBRfPy4sHRYV1VNvvNyp0UXKTgbejF/IYrgNmVZBttdCFo+KhcbuXC
         19gxa01SlGUumnXGBiNq65M2KAJQBtkRobHNE=
X-Forwarded-Encrypted: i=1; AL+hErHm2Q4i0XLXVY1BKPPtwUNloe6QdH494k8wpq/a40YxM4panEXlAbuuKCMfczSc21idfe2PdLrKEojdM7UkfIiB@lists.infradead.org
X-Received: by 2002:a05:6214:cca:b0:91e:f174:bc35 with SMTP id 6a1803df08f44-91f24217866mr51223816d6.27.1794595950635;
        Fri, 13 Nov 2026 10:52:30 -0800 (PST)
X-Received: by 2002:a05:6214:cca:b0:91e:f174:bc35 with SMTP id
 6a1803df08f44-91f24217866mr51223466d6.27.1794595950121; Fri, 13 Nov 2026
 10:52:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
 <20261113181838.594023-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261113181838.594023-1-florian.fainelli@broadcom.com>
From: Ray Jui <ray.jui@broadcom.com>
Date: Fri, 13 Nov 2026 11:52:17 -0700
X-Gm-Features: AclHuK8Gaa03a6YK8wdIy0hOQJz6AaBzp-hED-7M9ThqtXcPRNrlNZ6SGf6hTsc
Message-ID: <CAJ8Y1dR8L-SzbRMJf5G6eMCa-1mqmpbDJEs3Sa1q8MCkfq1_mA@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, torvalds@linux-foundation.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Scott Branden <scott.branden@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000049ac7d06602d06ec"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105924_890862_96111B1A 
X-CRM114-Status: GOOD (  15.62  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000049ac7d06602d06ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Florian!

On Fri, Nov 13, 2026 at 11:18=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Florian Fainelli <f.fainelli@gmail.com>
>
> On Mon,  2 Nov 2026 07:47:06 +0100, "Jiri Slaby (SUSE)" <jirislaby@kernel=
.org> wrote:
> > Both emails are bouncing like:
> >   Final-Recipient: rfc822; rjui@broadcom.com
> >   Action: failed
> >   Status: 5.1.3
> >   Diagnostic-Code: smtp; The email account that you tried to reach does
> >     not exist. Please try double-checking the recipient's email address
> >     for typos or unnecessary spaces.
> >
> > According to Florian, it should be first.lastname@broadcom.com.
> >
> > Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> > Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@=
broadcom.com
> > Cc: bcm-kernel-feedback-list@broadcom.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: Scott Branden <scott.branden@broadcom.com>
> > Cc: Ray Jui <ray.jui@broadcom.com>
> > ---
>
> Applied to https://github.com/Broadcom/stblinux/commits/maintainers/fixes=
, thanks!
> --
> Florian

--00000000000049ac7d06602d06ec
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Kea1UXiDNimY9XcISXAUrVauS3TPqfSofCP4tOVkOfR2zFsciCJ7DPbmanfMXAR2cY6kCgkZCqxY
9Szy6beT2XZUSE9/jFymRSjXZNnLqAe30YCaVeVQUqW9X3NqlPdzO9Ce8AqKdgBlVt4isO6s3zJ5
djaWSUM3zrweXgaVpSRF3iBUxK45Nb0qOkvz0hrBYM2r+iLWR2YbF+Z7W7lw2QMvkbeT1gXn+4pC
K8f1aWKsB9e6Id7uBOkCAwEAAaOCAdgwggHUMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAA
MIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUD
AzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmds
b2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwHwYDVR0RBBgwFoEUcmF5Lmp1aUBi
cm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt
26AjhRiwoJIwHQYDVR0OBBYEFLfOZFpVhKW7s+LOyKdJX5PQH0f8MA0GCSqGSIb3DQEBCwUAA4IC
AQB5Y3tHNG503cqE6g1lZJG3Z1SbuQD8ZXUbYqDNZCnUAd/+zUCraK7TYIOI83X+oof/CscTxVhf
5mazzhESPjHYlC3TLkkxDHQZi06GwKbI00651REpC78vd9dOdZnKnGjpFeDiwJKNxdarSaYiZi/t
6cZD3FIvDaJwYIQ+8HvZOm7FBicC41sMoaxGWZ/tdC6yRoLFckWRvhq0e7wyaBOH2ae8l30V6NXB
RtJd4XemoNk74ybCcGMro0zyBCzQhREo2slK5r/uflroC607XCCIGjLuB6TptSxV97L/9/QSrE2U
4JteFGVwRBJw1s7k8ICf4s22debUZ+OlB0mXjI+8EUDt6vdMeregn5ilQQSsDmBMnz2GzHfV30tb
X92uoE5xui1g4Q3BWkUVwd9wVHaganr3rzc+lQDnQq5cddu1supu3SWp5FqKq36rtf3RX/3zHZ0C
P2pCAlilDHYH2NRF8CYb+gqFySS/PUxwPmFWuD897Hewokex+ux0oZscsuRe0IttCbYfjl/+tSA0
a6Rd+AmkiyASFgEHsLGl6q2OTPYU1PikjUe5RXTp0UC7bdPQXzxaORlh/KWilnz/kV2XblDdybuc
Qz3eVIGvTANnIqPpz94oImrgHX48hMGiH5gGNznLwDBoQl4ZSfvlSi01TcUsYlHJD3LRZWbsh4VG
PDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDCsjlIbQJoxUU3h/cTAN
BglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgwsRzD6R9Gy+coGmfGJmRyPH6kfBGzeVP
2iMukDsr/UgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYxMTEz
MTg1OTE1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEB
BQAEggEADO+qUwtfpVLd1fV/r69edbD31HkC91zqv26M4GOlBqsAhn5xF41So7NOskge9S29ngKd
E9HJQ9/Q1HEXveulOAwu9jkpY1W9Nax3qJaIVg4zVuNnV6NHDByBvrMc7jVlC4+Qir8k6b7gSr4I
vLIn5r2nUY0osBQ+mwHX62Dj3DNgWpvDWcbqP5CzjvYEOdLaOl2ptMbvmJVcaHgfPvMMx27KG4Zn
TOweCb6OsSKoJgjGp7AEaAM2NSkxitr7CR7WlOiDM0/Z+HURR68EwNFajBP9WRfft7JfcWuvvgSg
8puYIod4ypnR9BjLvtddf776+7kDBQejD8/ZAesT72uv2w==
--00000000000049ac7d06602d06ec--


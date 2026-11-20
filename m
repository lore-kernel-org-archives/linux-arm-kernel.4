Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5764B606A6EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=04+17AmI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzGNs+bG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mqNjdS3AWBLjWitD65Rq8OnZtYR5YufWBTW+VtBYDHg=; b=04+17AmIYD3DLZs5G8ZB/Y5RPs
	IJ4NSFIllz9SCcxNhUaB5w3RaeHLt66kWWaXeEUmSZzRuZhOBVLs0GKSdekLg75oUc3Nimt6+xaql
	C3/ln8MXpIEIchdqspjAav9rT+1ssJSbi6U/tQ7cBF+WC+V4ThT4EnDmvwirlhqifdvXlpbk2NNaa
	rRN/ezg0CZYjY4xkVoT/TUJvtpbQsx8xxihcfcGxap1OfrM3/M4tRT7DqJejzo2eoBg4HuY9Ezvce
	+41Mfo45YzNCauwqEDFCExy4M6xkPChnzThur68XJDIu26sN96l4nC0QJ96D8JbgMzkLsA/jaofwH
	AlErg9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUEn-0000000G5Hs-00Uu;
	Fri, 20 Nov 2026 19:25:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUEQ-0000000G5Cc-3Agq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:25:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso14515715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202709; x=1795807509; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqNjdS3AWBLjWitD65Rq8OnZtYR5YufWBTW+VtBYDHg=;
        b=PzGNs+bGoPlCdA0RLinwd0un4aX5a+fF0OK19iVuYotAq6kbDNHq3jYXXA0I7qf8Q8
         Wc5/UACp6ZbEhNQih9R8UUiV3rTX9v8zblVv4QKRhTfHRnjIAUnUitwLgZkO/OY2jGiF
         XqXwUSOLUaHPqqhpGxngLqJrYJB27e0Zl8UHjmIlyMbmEW5EGTdtP6Q4De7chp6DBwzB
         /HMP0Ek9r9hJNuNzArc0WoikitO+uS/VnDotCrnAwvPkSA/3e7IsLbtzk5uzBvU5q5UU
         EFoievddiu4JTHqUypcBBjyViqbUkW138jJzhCCGxn1SCWzK1q0W+5qJdM2Ltdw1j/A3
         wLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202709; x=1795807509;
        h=content-type:mime-version:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqNjdS3AWBLjWitD65Rq8OnZtYR5YufWBTW+VtBYDHg=;
        b=cGnqlOXSyCIh2c1jxC7rGTm71qzCb5Bk4jd0Z2LECule7KYrA8kue95fnok8FO+Ox4
         JhC8A/rKzPUDavgZIcqCVlQav74qWWoWoGD54pPCj3L6ilfEGlnYrQCRYacRJTijpqmL
         rugjCr52jdKRdPJN6p4fVnWbcpSA8HV4caYHWNxbsV7zVhb7iGTWcqnVek22Ufde5qxn
         lwoXrOCLxYcOlOmeWewcQ/5OkQLXxM/EPs4STf2b7cGObATfb26KF4B4nAhe3C/khNrJ
         6n/3zKN3GcA/QnOnKf/qwQhEabFjEmOTbcuCzvaT3r8nj7rG9BV2ZLVSsevd4aNsmLGk
         IPkQ==
X-Forwarded-Encrypted: i=1; AL+hErEjmfEc0dDVqs5HxYVWYjchQUjfGu3G/pSxvx/f5zUaEWuoGfVmbUA3W2X53pMUlYw7M20ln5jw2VVZdwpFPE+8@lists.infradead.org
X-Gm-Message-State: APuU4Z8M3uf0GFu7jBA8EScpFEm/somAm2yq8m91y9n9jD6LzsRUQBHs
	iinPfgunwxz1GozBYkjnfthwwAvs0tSC0FFtTjmqhU6KzDx2S2NpcKxH
X-Gm-Gg: AYBFou33zT3NlRBADymO1ZCiEzHV8BESITY5Wgdb1jCIvgqEoBEvOb+poKdYlY4Z7GN
	wdDulvEBLbbII8sa2x671PcyvtEhqdi+qiYEN4sjNVBfcUYviKbvUhjC2ZFA8q1lVQFJYtE5QMl
	D8aC34vnLBPpLuJ112ISYC/f75vRKxdqcr4JJysjMFz71CZDPzXt4gKnaowWujaKA8GCHzwwZOh
	P1hmt2+TZtPIx4gUVHpG7c24J47c4uIcJVdVDyD7Ij2GL7JOxVLh/N/DVsA24SND6m0WxeGcdUa
	h0K41Dx6zJYfs5htmdw9pPuPj0eS+7g+QAFSFfDS23KnFa7Xe3f8FstiwtpkQhoS6l+uMQu734h
	cV/xzkT26wOh+jWsS66aeG0JgfdPX0ENerX3SenLK3TTCUBhaGw7Lkh8BqobDYWl897REhfb800
	x+9Y8Lrx5CG7SjptoDeufRArlQ4P5opHx1fuey5+8cdgz+NBgz3TY6jXfQDn6/ngINShuQezALr
	3uLWY90I5PO7p4JdaV1ZwdsTRx8om/j2TcfZSTvVZHBXCIK6E5Y6FsMstnIecySwsu/g2coDRNL
	+x9M/CrDq825LKOP06CklUSdao1WnBNLVgeNkMcOeA==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr87715445e9.31.1795202708890;
        Fri, 20 Nov 2026 11:25:08 -0800 (PST)
Received: from strix.localnet ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm156934995e9.3.2026.11.20.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:25:07 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: zx279128s pinmux questions
Date: Fri, 20 Nov 2026 22:24:58 +0300
Message-ID: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartw6-oKKkNSM-a1Gvi6sVDsg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112515_435123_A260CED1 
X-CRM114-Status: GOOD (  12.41  )
X-Spam-Score: 1.2 (+)
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

--nextPartw6-oKKkNSM-a1Gvi6sVDsg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: zx279128s pinmux questions
Date: Fri, 20 Nov 2026 22:24:58 +0300
Message-ID: <fWpK6nqqTOKOq96a3X8SYQ@gmail.com>
MIME-Version: 1.0

Hi Navid, Agustin,

My next goal is to clean up my zx297520v3 pin control driver and write a 
proper binding. Before I do that I would like to understand how pinctrl works 
on your board to decide how much code reuse makes sense.

My main question is if the zx27 board can control individual pins or if 
multiple pins need to be controlled together. On zx297520v3 I can set every 
pin individually. Does the same apply to your boards?

The background: There are two ways to write pinctrl bindings and drivers: 
Either exposing a simple pinmux=<int> setting, that sets pin 123 to a 
specified function. The other way is to collect groups of pins and possible 
functions they can be assigned to in the driver. They are controlled via 
strings. I prefer to go via the former one, but as far as I understand it, 
this is not possible if hardware links two or more pins together.

Can you advise me on what you know about your board's pin control?

Cheers,
Stefan

--nextPartw6-oKKkNSM-a1Gvi6sVDsg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsAnoobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiLlgQAJJ0zq5mUDfB+/b36WRV
Bu2mQ35UT68tCqyJsWd2QxtgxL8zQ2ybuAQi0V9e3GdqUK/e/kRrhNy53NJsLSJl
OtAjsdBE8S6WsHqsInPXALOrCMZi/+3SM1dNCR0gUos2Z5BsS+CGmffroGo1XT5D
kWB1nBWms7455g0Fp7fDza0nimi2UH4XNq45hjIospekhWepr7b8L+zuGzO7VY1Z
WIgA8ctX85pQBcY8m8Jb36ZfPlKuPCscbEoteeeGN4HSglKPWjBjENrgb9i/jsPC
lnepJLs8hcmBpadr4rS1Em/u+UQAr9St5vXmzY4U8p7SH2bO9ggEyS0kEMH8GeEU
ziiTpo6XJ9CwtTVbi8USbgZ0DTlZTIlXxMMQC5XHXzu+TB9pKBP7FY9D6yY+gzq/
CLoL2DGIcYPhCP/4oZwtSOvQ5vclP8cDvVy7fs10ELIu7h/biwu6PlL4W4d4YAlq
dgEvx5NDitwNir9EtYjtazc6oP9Y7G7YpFV/p3scSsHTN8O+z2hcueT4FnZHRAIv
XdTEAHgHQzK14Q/N/zIalvynHJYgfFi+kj/Mj/PgrkjvI8KCwxr6xQoV8wj7bAuy
Nmj6oguVv1t7lXx17RDYnU6dPG9lzGr40eL62oFDDDtV5YunU0I41+Bvok1Jb68f
dM7uMAUywStBahdPTbaaaQfv
=5kkL
-----END PGP SIGNATURE-----

--nextPartw6-oKKkNSM-a1Gvi6sVDsg--





Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F7D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSW71PIR;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S4oDiOmd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=; b=sSW71PIR01hmBPzLN8bffibEre
	srTUMIPdvlz8joYEEVabP0joZ1SZYDhklzZWYZqXpyKQJIeQ7AdvEC9O9X7VL+j2iwitJ2LIks/8U
	ze+ars3BoGZeizUWk2AsRCl3DR5CSRIYPCGrLXx+mAA+Nin1TO+w3+WnTxolvGf/Z2Jbk+wSIsy2D
	l3GWv8e2OSKWHAJOgKO1FeWNJ4dg8LxKcn8aVoXMLqN0Iozy5SFY0z+ZkS1n00TRJsvPQUwnFOgFv
	cbGROVAImmEbTXdjLR9YL2uq+Tr/NLhmDPDctn+I2ap3LIeiu3pYTVfFKaNa6YACXblRzP7NS6cfD
	4nkQ8xoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPsv-00000002cv4-2UHr;
	Mon, 23 Nov 2026 08:58:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPsK-00000002clc-0S0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:58:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso15994215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795424290; x=1796029090; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=;
        b=S4oDiOmdYKPqnZueH+0VZZKWLXzv5YaYKZbAK1sk/H1IcWXs3ap1ZPsgLK+LTUsuqS
         dzdmbA01RlKnilZrrGFRycaERoAYJPoYL/iyvkk60xDm8cJx5Tpe1jerrt88KFqkyo+c
         9vl/zB3aTHOGqGvcBxeXyYUTcgln2jM2S10A9tLD4TwciCMyZG14xOUSeBQ6l5XwtZsC
         UsdcaIoPCWIW9Utv58zypYsLjXyFkLnaN61NxPyOhxZzno1W/Wka3sspYaQ5e5/nauqR
         sGx+BaKxkvJwe3Ly8+vm1pEQmX7vbC90BdP/dmyokhITIC6FTr4Mda697TrDlmaoRh2b
         /GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424290; x=1796029090;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+9MbVvTDshgnA3ihP8j4dNe/hCNqTIen79WI8/6oxE=;
        b=GkgA7I2jBMzT1SgLlqOUW2GlkWrR/Xfhtgqu6Iv9aSkSwb1m8jz6HCbZSdYnXUOrot
         LPb+aeJtRxZJbrPDr0LDS9FSibms5kNeHpgczPiq947+XKG0KEG2vvD+I6BYW5tOU2xn
         n5joUCx7I+KkvD8/EfqWxmUddpaslDlbaWlOOG/jh5xoHkgikfDYlWtvfa18rUwTlpqJ
         JUxrK6FvW6peXNDNYSXd51jl35GcjO7aMU8q6wrzarrlltQlmNELbxDMU2vE45ZyS7Tq
         aM5dd6ffFDENVZRr1KKWz/lNboW1jpaicjlHRFXVuVyaiD+AwLxr5aucvD+xT3J4ToYR
         HFVQ==
X-Forwarded-Encrypted: i=1; AL+hErGwn+1jUBJ85ukviaFiZQh2Nn5bU1rh2hOrLJ6jKMxgW9NselkBRLAvstRKj0ia5gbwNyDBJmj1uxYOzWWDTIkp@lists.infradead.org
X-Gm-Message-State: APuU4Z+XWKEkQSbXspGuN2EzjUNjFmGV3fc3JEJZEdUNWfgTW81xeAXA
	Wk34m5bpOCtWqWVNBGRuJEcoVh031m6jJRBUr18r88q0pjfPqUunyCBkzhDNJN6RpYI=
X-Gm-Gg: AZFdTZdG7andZh/kKKid+i8y77zrALdym7u7Re8Gl8zYLCJi4ebRcG4SSBFhB0anWuJ
	5bjZQQwXYQV8N2YsX7M8ESI+KKKH1NCxD8OlQ4N+9JCkr9ReD0giS1kl2rmuBrwxZUfIKLE8BuS
	Ja2DQ8ZE2kH/G58rAHe1AiLtEf4JSIRhaEQlawch0Fj/RfNRp/+qu9EhmlIftB2/i98vU5lk5gl
	S4OlSxoBbNH009ZL39q//phhMdlufAtIFQudZic7Ejr9P3aVVQoXtLqb5A7z0u5yDWQ9IOHc+Eh
	9JIQnl2ior3ljJCiG6ZZ3DFBwIBlrQaWGFkW6XsJ/nVGnbMU1szYcpGgfHGrnvErqF8dxIX+aLL
	ECS0zU6Z+MmI9G7x5MsfrB/ZdG5JGEbsbx2sy0h6wscNtUBNrg6fB8zpAkuNZd3JW9GUyn91kMJ
	iAai1u0H/lGwfWPnEB00WLly0R6uBfxK6GFpazMX6F2TAPGeMTa0YnVuPDbvK5VhNhni3AFHeoj
	vtBf0GvjGj9/JpjN0zb8OVf1zzwUweLlvbfbU6ll7m8uXubZ+l6PSkVddRFG7rYLwJYOSrJsHkT
	9ZhO2MElFAy+A4zORHy2U9/WMRWcd4idkgeH1fg7UcSl1L3amFiJQsuXktZQF9RD0KXTJvp2qkw
	HLs/N/O/hy8IAzHy9X3FaOV6UHtAL1gDIeYzZHg==
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr211375095e9.22.1795424290183;
        Mon, 23 Nov 2026 00:58:10 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8849247asm331942575e9.7.2026.11.23.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:09 -0800 (PST)
Date: Mon, 23 Nov 2026 09:58:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, giorgitchankvetadze1997@gmail.com, 
	amin.gattout@gmail.com, antoniu.miclaus@analog.com, gregkh@linuxfoundation.org, 
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to
 device_property_*() APIs
Message-ID: <awP_vX8zyTNCZGUg@monoceros>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yb7ur3sdfis2fllo"
Content-Disposition: inline
In-Reply-To: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005812_978642_E52205DC 
X-CRM114-Status: GOOD (  11.67  )
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


--yb7ur3sdfis2fllo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to
 device_property_*() APIs
MIME-Version: 1.0

Hello,

On Mon, Nov 23, 2026 at 09:00:57AM +0200, Abdelnasser Hussein wrote:
> With no OF APIs or struct device_node left in the file, drop the
> <linux/of.h> include and add <linux/mod_devicetable.h> for struct
> of_device_id.

That's wrong. <linux/mod_devicetable.h> is a dependency hog and should
not be used any more. You can rely on <linux/platform_device.h> to
provide of_device_id and just drop <linux/mod_devicetable.h>.

Best regards
Uwe

--yb7ur3sdfis2fllo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEAB0ACgkQj4D7WH0S
/k4jWwf9FOlwkqlYHms84ZIP22YljXL5kC4jGI63Ce/xclPb7V+GpzsB75YAqYlm
GWJKN5/ikOKhG/Nz/hTDiqbmVIgcqG3XOULPz4itm7V2+ZTQyRvfQsirNJzDaxTQ
PFo7krPE3pBFSIBcvunsQr6/d+VMNUhHY0rSDcr2XsHs7BjG29muEdAbr/TLYdOe
iqt0GzTnTD96mAJSESDLQWCtgNb9pbl/El6PLhlXyWPmkhj3kIRMf92w75zB2zLs
JEpcrCMaIBg/wL3OE7CyZuiqEENsbh6jmorJXFqTOEps80hcJbNlOaN3RDTKNnG1
G1xKxDMU6BQx3J60p4ovhMokWQcSkQ==
=t6hY
-----END PGP SIGNATURE-----

--yb7ur3sdfis2fllo--


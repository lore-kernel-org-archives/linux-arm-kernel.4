Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD8606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SiutAlSU;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TOTYNoe/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=; b=SiutAlSUNq73m1gD47ao4UrU7F
	yUdgFKQOtVyRW2MvOjkEOCFArHpoV9PYcdeOsBU+UlRYWXUc6geNXQyUIv76A/IpQn95/h+RR2Itp
	o4V6AFrLlvUc0yzyyDlplQ2J1nhvVaHprRzEj+m05WHSRS6rm4iILocb7yWrFQgUcoSs1S4SDRBu9
	gMhQ8VrxneaVOWZdfqWAtuDWeHKS2Q1GufNCvViUp51GmRav5eQ7gCQ6sm6tXcA6meYSnVqr/uHU2
	PQc13ix/sscW54TK4xZB/JxnWTZVP18cEW+wbrXWXbXd6mSU6YZUUxj7vSThd/IlkCxeFRhLBSjTn
	nffOeuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJze-000000065C5-30L4;
	Tue, 17 Nov 2026 14:17:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJzb-000000065Ab-2AV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:17:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb606491faso18122935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794925021; x=1795529821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=TOTYNoe/umyuR5T5Y/j7h6rux2uCS/zj3xIVpfHv3d6Ej2hDaqoSwfuEc8UJw2aaj/
         vl31rLXuYX8GAoqzoBV030uVg7lpHlVM0Ii2aJH8V+8zCz3FDw2m9UAQMxKMRiR9zDS0
         oLQoL4/QfOU6nmdSxLr7J0oY8PgwZ71Pp1TbWAuh0ekBBZALDyLCd02D1nrd4UO05QVk
         mYmkjYwi3p3bm1RvbXAvpyhtsXlnq3+ltMSV8MkGN7tCJtVf6AKgri6xg+wqJpH6qHT4
         LtlaxmmVNEmGmMvhNF2vyoKqu3kQa8Y/goW4Ox3HaS+vZRwWtF+MQZhJSuYiDrX3m/Au
         ouLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925021; x=1795529821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=ztSslOf42+N9PzOoW2aG3tnoIZPaVY7X+Mc4vm6kNpFgxjbxGh0RXpS5MqaEoODHOx
         94fJnftXMkLHkcMzoWWqrGxlgHmmH+1+4DDPzcNzypY/phDst99dl6KptY3X1lqEx1rM
         WVfo6BJE9I7hPNAO0eEHYmtyS0en9OE+ZvVOM8aZHGKU+8LyZQREjFSbxkCRTdfKlIwt
         o6pOqRd1vzyIdujqum/hWmRy0x9A6dJpScHMiZrgfbZUGUkWfkJEk0xNBLVwjmmf5YfJ
         GQ8iV0dxuFzBHhJaQ44wfKTxY8RedzYcpYb/Ans2J2nm5eSMkjj3I6x/rpFcKsdezF6J
         iKkQ==
X-Forwarded-Encrypted: i=1; AL+hErGjy7V1uscxDzgR6gGV6+i7Dg8t+VPYiTwLlWbBo+yLM5c4IQp4SUaFKvK2extrETISSimq/VhaRvio9y23CaIO@lists.infradead.org
X-Gm-Message-State: APuU4Z8FAyNAi1DAw+zRqj1ZSvwaO4Jzn6M1IB0Cxh8RSEdBIS17u8aZ
	+T4iunuZ7QjFRO2eqJB0F80Pp4M7J6qCl5FyGlJsV+HbKXUW05TngKyZUnl0kkPrPr4=
X-Gm-Gg: AYBFou0THiAanjpEwqhV8ICd3Wk3LYJ29gXahZwvKaF7pKivVckyI4hnUZFRWYfeYfX
	p0Ftz1SJvRLm6VpvCeIMznkT2Wma/8Ta5GQmZ2eqNeMV/KPWElFTywyxoCXVyFUlYTFDi4/thL9
	rqFXt1Hm0iYMrHxqVnBak62huPVTWiGqU7HtLnG/LuR96avOAF5tDqQMGIB/iUui21tik8o7nVW
	+/ISdUld/q8Ct2sqGTYIxgFJIzDWWXMJhGwb50kd900+s23CoCjZrD6OTxqZJ6+gi6vHej3tWDz
	vG5W83v71BJ3MwrP7vb9RVdBwRY4yUkA259jmpkC8n/5LVP5qDHmQHl6td0oBWqMzemAKfM+vGW
	ZYfNA5YVMys0Mez+IkOvdh4hh9Jd8x1psWq+udchP0cMF0PVhr6K6Z8/i5cwwowgce+TSwxSN0A
	9p/Wmqw5V7orM53UTh+Itu45QR8R7pcGZTM/iyI3jPksJqWUirWAsnLyuvRbD1uPZt6eNt8hTD2
	teBDniPqGJKo1ogoXAPkE99W98gxbFW8AmeZuQacrFxLUuLmDdFJwitIEY+1we7duyzxmmfpRNn
	9UfG1/HLwPOU47oT6uowBuYVS6+GajrJgqjwNXZF0PLtmOb/w/xDOVVHlxA+fI8mx6lzFC6eVWG
	Y5Z2MxTwPmVIZwHE=
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr223922505e9.10.1794925021592;
        Tue, 17 Nov 2026 06:17:01 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb5f350d51sm125990395e9.4.2026.11.17.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:59 -0800 (PST)
Date: Tue, 17 Nov 2026 15:16:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
Message-ID: <avxhlPnmjDhZlUmt@monoceros>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlzj55hqn4bynrzq"
Content-Disposition: inline
In-Reply-To: <20261117060501.2611071-4-zychennvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_061703_568079_80EAE1ED 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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


--qlzj55hqn4bynrzq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
> +#include <linux/auxiliary_bus.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
drop <linux/mod_devicetable.h>.

Best regards
Uwe

--qlzj55hqn4bynrzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YdUACgkQj4D7WH0S
/k65jggAtbkfrltbaO6eNfAgtd7yBmZsvKQs9ZqNLrv/4BbdaUEN9BpWSES8c8TU
8A28wC5BGe+pBDAUyMn8DquMXd9blMhvyFP+4MFFbx88o6fVpv9av+03ek1XBeSb
s75G4PhGBqkTX887zZAsGLJlbHctBxujR/+IjNM496gRWStwZ6dqjd+ar6GcTdDC
I+QeQmgJl08pRBwC03L/nY9R0n77kzF2oj3u1zOO3OOnyzkdGER1z4P2EDYpsI3f
LU58xgiNfDdY74WhBJPcEY0ZzD8o6CU5N8xms4Z1ry3OCh7/QN+QiuFyf7ZYUj7c
wc2kMsQbp4G56o8VwLMzjqTwTjKdNg==
=gJWw
-----END PGP SIGNATURE-----

--qlzj55hqn4bynrzq--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A429606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYJjATIS;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z9CKBVho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=; b=rYJjATISOAeEvNS+ja2j3yPwUb
	37VRasdrS2WUWw4occZy0yn2neoqWhFQchTULtLnEvwEQNFTsH/x8ZUh3opyoKwgfjOodNM3jAztd
	PLz7y7BZKRwyK/vCsscwyX+4720Fnoj2P/vinVwMD3eGb3FnJYZCtGv660ERN/xqe5t3n7wiE4mFk
	Yn4ps8Bvl76/JLhwaiHyWXtqdUYP8yCeo7Bv0dNnje9XhnECtXaj42j2mxFRyIks0wKEbtG+tdccx
	BhVInOE4bBofk1Tp8JI9GVuuwGV+Exl1FDjdS2ngqhNbarv+t1eP4S/3miwLAntljfWTEV6m/yZqs
	rIiv4V6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNG0-0000000D8pJ-1nAL;
	Fri, 06 Nov 2026 16:57:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNFx-0000000D8my-1BeW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:57:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so7539225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984255; x=1794589055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=Z9CKBVho7BgYf+G8P0Z4FWJuinoS3himktrfaTVYRq0H6xh57NCZrNYY9MCnGQ+nJi
         GaiLbFi3gJPDqs1tMsEiOfslFb3d+ueC7HYr7vGusJRB7V9XLBgRVM0GVSH7K8XxMsL5
         3kM8CG5lCji40IqVNpoLHGyb7aM74x/V6ufCiTz/DfW0fjbYZaiNmlcgXz9mP2kA6c4U
         GVfGzjsQNU9jcTBfRvSvviqG6L3wuyxtSV2vffHuUwTAD37//OZINz34HD/RdXL7K+wm
         H+v1PkwksQMYk2JBWYFm133tI6w2xZakiDMYkrov5ZMsRdx2kvK5fmQ59NJOiryyiMQh
         TPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984255; x=1794589055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=ifS9aT2FyajwX4FvuBYURpIrQrshvomwNpaWI8IcQOP0o0IxwEp7Xns0qACmw52Dgi
         qYOnCT/z1sSs9jOkY7A6gxROEX9ryJnQNjidodDPd7KcMUEy7hsijErpGnCeS7LnEO6n
         k+dHxgMMvh/az0MpjVgzaMYY/3pxJZWexvOqPNPV+z7D/mnYInuHCeC93JrgiXj5MSLY
         bJwoVZ6z72FZWS8etOVXITQMV44nb3E7I5awi8x8UK4pxkCdS1rtXz5wo3hCHKb0wEmz
         1CpU9eBzQ7E/5Bb987sBCux4lRDQUVMSlJtkwaqshybqOZLqoOP64rgKzs7VN8jpobjM
         zePA==
X-Forwarded-Encrypted: i=1; AKwUvBwege24DwTTmp/x32NYwKC7x25Buju4JfwKgUS3ZmFZLmXjyzari+O9OPm5eYLHnp+JvZqhxw4+5in0GJ6cuxgd@lists.infradead.org
X-Gm-Message-State: APuU4Z8wmMd+y9KMtCwIHNq0ATzyRi/J05BgmUxDXFaseG2ZAQ3kMwab
	3AgE7q5urNYnVhj3yP9Syk8MEJ4CLkefejXwsoJA1KGv6SrMvsQ77tufKwb8u1Tc5mE=
X-Gm-Gg: AYBFou2fOySRxBhC1Vbz0CslG0mtiWtMvh42w/rKpWKtxuyixUm0I9zdyNZGKLCQ3Ua
	Zjmmhow38XhXxvhtAjdSw9AK6omF6johirWhfiUGnM11pHTrEBXbXBDhmKbZOoTNU/3xf0RFcUd
	AVgkJr1hnmIEXCQakVH+dbnO9ZROjoHNC79RdveZHhhsqd3NgqcxwfBjTdz9UHa3DC+6ETTUqmG
	QAGCsMl3Zi/TX/SX7sjiYGX1Vk0eOdRvZgHrtxd55WKJ0UaTq7/6FjSeEbtqaGrwM0QeMKumDax
	NU4GYLq8WKZkHwDpwRM4gtkyHCG2Qd4XVin/ym5TmCQD/T3f5hk5p1w4B4XUNLGvdFXWxGysdGB
	X5Q6DDMmjgcM+N56HkcqOYknwRfBRLZ4Tcu0ztGLeScTxSgEurMDgCXHY30eMbbPGlehko8Lih9
	OTKnM6UaPMwPnqVUhdk9SnTPPDlxazPiy1dyrjvR96YCIDLhnCii+06qZYb+GqvyTjUte2YFo/E
	FmByURJX4TsZ5w4brbI6HKLSyY4hm7o3fv3krRnHzwLm+OnzTIBXfcx603H3pCrR/sZp/e2VQvR
	2bPqEiJYyqfNu1qgiQgGEBbJGlNaMIP1
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr51738615e9.19.1793984254955;
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b571f46538sm144730095e9.5.2026.11.06.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Date: Fri, 6 Nov 2026 17:57:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Message-ID: <au4GkvPTXmcvReoj@monoceros>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgc4symavcbtq745"
Content-Disposition: inline
In-Reply-To: <20261103022202.2139674-3-shanchun1218@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085737_619190_DEA5EB54 
X-CRM114-Status: GOOD (  10.03  )
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


--xgc4symavcbtq745
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--xgc4symavcbtq745
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBvIACgkQj4D7WH0S
/k7itAf+LYAMF4hi693tZ3vEcl9qdHQIjdqKde20tlG9djgG8wsFu0VZ/opYIUir
Ba2Ft+nXyZ+omHvukP/oarePmgmCz7dlRmpi6tKOAV+werJYpdagvT2ZHxjF2/eU
SRq3hKVqHZVh/RS7hfRwxcPjy41xhU8PPT9ijH9syFoVtOUYbKKLjzdGTFdq0VNm
TeXK1teYk1wcOc1zWnVsLIdMk2DtMOGpFMisNxIvSXPHr8CPqfQh3ZhDwVLC6WpK
Jo3OwmvckiCe8ewY1FX7j/uIvM0c69sIBKKFnHgagXSTXFfhUgxYs4I/UgegsndF
7ViQI0kKjp36E6n5RxerITZ5eDHGng==
=zoc2
-----END PGP SIGNATURE-----

--xgc4symavcbtq745--


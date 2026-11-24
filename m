Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFCD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q4Fwsafe;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O5ly5Nr8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=; b=Q4Fwsaferxpn+j
	bMXIEIFvnmEfl1JFaUW4JGK6AMiAhqRve7W9K83le6N1CxWlT/G3AONdLKxAUz1zkxe8incec6SmX
	3iSsfS8X1OZcEAn7HumPQZ8heR+asPuUIwN+1wj1m1ClGoUOVINyN3sm3gPWruYqifLZrI8moACaP
	ijh+PyS7eQbsPpRg65IivumgZyqcSX5+Mv7OjpXCa+aaM9iHAKuS5tjsaxpvD/VjipeALI9mP02Pc
	lxgFnJrQHy4swLB17urb0qKZDOTcFNQzjExpl9/CUeFtaGXcFo4M2PcG0FssukA/zDb1IkUlOLeyd
	G4E7S8GMNpY88TtdfpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnDG-0000000680v-25O2;
	Tue, 24 Nov 2026 09:53:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnD6-000000067yF-3mHw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:53:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2665391f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795513991; x=1796118791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=O5ly5Nr8YApdZWtMx0IoZ56O0foMmh5SPFz8cP1SLd3WG6i1pJzQAL98pYBwbSLFB+
         xQsLuBcwp9HGEUdXf5YXjTC6X24JAiNbmK8LmDAR/dT8GqtRN2WUaxtrpL8e5GB0NwJ1
         JZ6XxEQLsJKYoPVeRX42T21ZMJIn7FsxX2TFHlboEXhc2UYX5m5pRVDRMy/7xIXNhWLG
         J71WIAf5QSnX2SCpPbCmm5n4B40zLo2RmC3K9Bna4HPWYOfP8cz67SdI9PitxZlmnRCX
         LfJYr47wZqT6tXxiLwF0GR2P9K6EPZ2bn5fHq5dtFOf1T6FXPWLmLfHq7xHOGZvRI0DS
         4qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513991; x=1796118791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=RmaCCtrtjiNPxV1n27675egz6ZUR1Og52ev+t4nLd7TPpgrqDFcyKAF+d5ynZeyiFV
         h1HdNjHZqmatEa35JxtNBchVyyRTIilqJKKk2hHZWz8ohgAZZhFAWH0wHqT17OdD7mx0
         SZV5SnPZqb7K6bvR83VZTsawQQ083EXXnai/Kcadr+fvdyomxqYctb3Ahc5+/0k21q56
         5T9GcrudD9ikODlM7GzgN8tSSR+VLAMOOUOGCCU0nrHMtQh+uNmd9G7kG3PdXw3QZQY2
         xYf3r4WR6DT1n+wEaU/rc8OsN3zeX/VWBzCrFMqLKwjJ5hSKMpjpDg/eKN9G7upTjPBr
         trzw==
X-Forwarded-Encrypted: i=1; AL+hErH7C4tfb+GzIm8pMPAA1gZmqQI6NgKJKQ0zMkTCrcGy/z9+79Wp2uW8B9ud5qd10ATtUOeoan3sbQRIRDP1MLyt@lists.infradead.org
X-Gm-Message-State: APuU4Z9em27WIg7JNC9oMS/j8DZOz50MN/69S+jMjOASGjctISAbs79h
	oPn/UZqqpedYEixAJYghSVEzc1Fg/q85Doj3y9b3QROnHAmqe14hxBd86/5FJx0RJbs=
X-Gm-Gg: AZFdTZcN2DqGB9ftahYl+wIkmAZSeZ8MWig4XVGGuJHBPUTAKlOpCU+Hi/pgU6wQJ09
	9YhECb98bIwcFB9Ix8QVF0SFeraA4WEfGkRLSdXx7bkEDlLM9VbmlTxfnpkA6Jf2hn8yEqczBrI
	0SQDBAK422pnew4s4OX/1RSLdqn1tMQnU5HDLvsJ4Sd63ZgGhXH8TSraVL2xurYnYj5lFfUQ+p3
	SatDGbI1evbxfO6gyZuLY1AqUgSOlMAwBrCky9NYR6/Wwe+G/eqIcDnNbrxRh4DEMjpnENW6Fmc
	zdCpbfjAcvXXg+xO9fzzq0AT24SqKBzFCQQGQ3DdUpsSWkqrvbl0BnDCVJ1Uwt30lFmCaKbXL6d
	O1fXeTSs31cf6U2n7CEGAnmAfZKHIjwC8Z4xgBZS/LxIS3JOyVq2QMtkz61sAwSzBFMtgtz3A2q
	+DwpVwl9ZVGAGzIZSVT0VxLIZe811KItmSLkFk8hB07XzA4qEYWQTKyaJ/bZu2VmQ8aitz3WWKz
	pPJMIgqWTsfUOQX9iOCZKELlUGrElCaGCO4Hd5Gsj8mcVkaMKnCcdvWYzfX07N2/WE8u09Ejs/L
	wzOaeqwhfd634bihZIWrHY1lOKYI84vQaGP9svMKVlQVJuMAILb2tjR0Tbz2qId8qhhbyRWgOlL
	+Rw==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr309330195e9.22.1795513991045;
        Tue, 24 Nov 2026 01:53:11 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm435581505e9.2.2026.11.24.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:53:10 -0800 (PST)
Message-ID: <2fd706ef-8205-4564-bed7-527b6bae8790@baylibre.com>
Date: Tue, 24 Nov 2026 09:53:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/8] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_015312_982745_76CCFBC4 
X-CRM114-Status: GOOD (  12.39  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can tell which NPU it
> runs on. DRM_ROCKET_PARAM_HW_VERSION returns an enum
> drm_rocket_hw_version value, taken from the compatible's match data when
> the first core probes. The PC_VERSION registers cannot be used: the
> RK3568 reads 0 from them.

I also spotted that the vendor driver uses compatible-based matching for
this kind of thing.

> @@ -197,6 +224,9 @@ static int rocket_probe(struct platform_device *pdev)
>  		devres_close_group(&drm_dev->dev, rdev_group);
>  	}
>  
> +	if (hw_version != rdev->hw_version)
> +		return -EINVAL;
> +

This check can be dropped, we can assume that a DT that gives cores with
a mix of hw versions is invalid and broken.

With that change feel free  to add my Reviewed-By



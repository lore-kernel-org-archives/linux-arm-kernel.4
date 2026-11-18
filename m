Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A745606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LDFp9uC7;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QIFrsHgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=; b=LDFp9uC7et1d+rNpWjrLV+Lcb1
	A+b8PtigHvoWFdZxtrHjNuDcBZRmWbZbc546DV3O/HOSFRitJOOaZY3Y6ve3MSnH/SIheA7Qb9uDV
	lsbvey+R/IMLpBWMgRs+qdszKrCR9QxjQOu7mY0l1IVuQCwMzLPFF5cRMvOC9DdhH5HeBO8xuQdxA
	4pnTmNMxq2j3lzq7+n8tye4UrytBF9vztCzbJ7GPZoFNUUwJNTGFaR1yyWkQGlkgJwPoZXeiT6BCy
	4MVBUKkDResTIj1x/QnBcbk0pOFxBaMdmAcdnNwHZOr3qvbhHrlmxNFET5aNlSyR6eEUhlQ3xXeCV
	vEGtA3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkpB-0000000A2oZ-2eUg;
	Wed, 18 Nov 2026 18:56:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkp8-0000000A2ne-2uMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:56:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so796949f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795028160; x=1795632960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=QIFrsHgo/01ab7z8W3FFRAZ9WfBi4zKmpy7VIOxn9hLVU5TGqYk6/DmTv3U3mTBZs4
         YfFQ1HFkKd0TqKpYM53jRNBZHngeYR8kUzhUQ/GEgJ1jP6a2GczuB59AQ66/lTDctTaR
         J3e7s238J6zod0jQa474aYisTIK5DCX+a1kZE+FVWHQ2oLBZvqb3ijHrmlwWm2NSPLjl
         DJ8b+yHTLLox5OCSRYO8wTbzpAAsiRAPYtE0zeTcx55y5pgZtoh35WsNW6h5eHsHik+F
         jWOWjff8zmtRFeEyfcGCkMr3FrroTs/C7vY357MK7fQ8zrx7oNTSw53cvM7l4VpN2MhC
         fQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028160; x=1795632960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kJpx+l472mqfYwLQp0H/SvSTP4XOwkgJmV7sYq/Wn0=;
        b=bkH7mCHGxU/j7+QhP/KIOTcKdkB42GQNuzebejmrv9bbKcuSaWlBAAZ4cjQpTmJ3lT
         1S96wDf4CI6l5LWMM3sb/cHAlaBJ10bCZAOOKk6rH1k70uWjxWkbTqQk8TLq3pn2WApJ
         TYq2x7PF8D4cSkikwcXSJQmsBah2b74J1A9hBC9XvWaGollJjSNT9igg3a8PoJPBMpPt
         BwTuwtlk/5raf4OC4+gS3f3YsZB6TRHSRVasg8YRL8zy6heYAdEXqwNfh8am2n+LXXzf
         CvlWphOvl7rArGjs//ncISJwuptf3FR9RblyXQdPoKMTOGi28pXY96EewyXF0Ij/9zIg
         Ysxg==
X-Forwarded-Encrypted: i=1; AL+hErGwNeUH0E3CeSLBDO8WFncyeVVxB/tWkmv1sfc3EQLdXCH8CFJ3wYsEJFYe8ZpjaYwkhNxTRA64hYPFhcJopOC8@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ldn0K7N1ikiMetHh5eOLbvQ9ixO+C9Vgfrq3zmLqwT+7kCzs6
	Wtkueq1sRSH4P58Al8szDyith0JxOgo9MzdIbTrPMy+SLkH468fIaoRdY3UniLb40ac=
X-Gm-Gg: AZFdTZeBR203Ayl+RddpaHUqUW6c0jHEk2iOs5un8bR7ujMxuuA3CnWG7ao0Ge+nyYu
	Op16CiRg3OAvu6WHfUdn3DcLoo7E+O8LrxsjmnjkSLmF/CB8/5lftiVj2tReatQuGJxHuTyZLYg
	OrEjD0MfM1RoEnLYFpZMquArDp3xM3qHYEKfvHfrc50DKyi86j3dyRPiVfRTDxZ+d41kh2vaecF
	kpR80GDrdKUl4PDHB+1Tf+aiyYC6+VHPb3Q8XlYQs4cPTujmMnwzT7sPx8sTy1sxr4B5horayUr
	kmkE1pKQnG/xgCN5dXIwbYpcKaGEkvMl8hCgO+2TdtYvoj9iBFb+YuMA02PI9aai7YDvYCuX2X0
	MIiyZdylFPYLIghnBVMPA7uq9leDIm+LMY0K5jlMYsHwePax6Ro395g8EoeUfiEC/UPl3lhObo3
	dvUVOM8snYfwvf9IVBCx/N4fD3YKMuOYax6i9HI1OeGZYQfbIrHfH3kvbxTMZWIAviEadnd7Sq3
	+g3GsmmnfwltcO2lkFQbNnu2FnIFCRqDi//0cVEVCYzKmmXz1IxTzPSxEN9dL7viiK4QHoRyUJY
	m3sdrZK48wTyGMyCGYIyYPQ1yJrLh62miC7vowrLdBr3GsVxlDZk72MCoa9ytd/0OJwc9Wh6rKF
	X+qQ2iHOYOtUGvet5sM8k7d4v2ET1WhOLtKJR7eMjc6sHNw==
X-Received: by 2002:a05:6000:4914:b0:491:8462:20cc with SMTP id ffacd0b85a97d-4a63ac6b48emr8023295f8f.37.1795028160455;
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm6144436f8f.37.2026.11.18.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:56:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:55:58 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] clk: amlogic: Add S7 peripherals clock controller
 driver
Message-ID: <av3zyakd8-7QfIk3@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-7-7d501d62621f@baylibre.com>
 <179499607256.413320.17594110166305844754.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179499607256.413320.17594110166305844754.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105602_754516_F7202A72 
X-CRM114-Status: GOOD (  15.33  )
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

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 peripheral clock tree is derived from S4, but its clock sources
> > and routing differ.
> > 
> > Add support for the S7 controller so peripheral drivers can obtain
> > and manage their clocks through the common clock framework.

[...]
> > +static const struct clk_parent_data s7_sys_pclk_parents = { .hw = &s7_sys_clk.hw };
> > +
> > +#define S7_SYS_PCLK(_name, _reg, _bit, _flags) \
> > +	MESON_PCLK(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, _flags)
> > +
> > +#define S7_SYS_PCLK_RO(_name, _reg, _bit) \
> > +	MESON_PCLK_RO(s7_##_name, _reg, _bit, &s7_sys_pclk_parents, 0)
> > +
> > +/* Named ddr in S4 and in older datasheets: the Amlogic bus to AXI bridge clock */
> 
> ... is a driver claiming it ? If not are you OK with it getting disabled ?

Not yet. Amlogic told me it gates the AXI data path of Ethernet, audio
and the AUCPU, so those drivers will have to claim it when they get
enabled on S7 (none of them is in the S7 DT yet).

> Did you test with or without clk_ignore_unused ?

And yes, I tested both ways: without clk_ignore_unused it's disabled at
late boot and the board keeps working.

Cheers,

--
Carlo Caione


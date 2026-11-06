Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E5606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2Jgra1i;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UC1d7YND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=; b=R2Jgra1i1bQnPrkOwrLTb3WLDn
	aKGfdTUUCK5xoqRVav7Nh5bpaT+V7Q1U9an5z8kwJfAuHoWdM1BFf8+mvyqwb+GEywDiY8S4+wwlv
	sFqN18uIWYppdN4ldeHdyvXvWYsA2VeD/IsWSzy3+FSJ+zbn0wOyHSYRY36T/dUuDvXF6GD1yVlem
	0AAOZe6j2elWk7YsqBCMmGAAIltzz0fcKxyzuQlf2ezlkA58OUJajPbHFPobOxgCG/oHyTORAFUkM
	AbNY+RquhMPhLrOFEfwd9DVSv2Qv2DukQ3k4/2wHDV+u2EMJgdiABxyCq8A174ftmiCthFM680aVh
	KmFxBigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPi4-0000000DXLY-37sR;
	Fri, 06 Nov 2026 19:34:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPi0-0000000DXKR-22H7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:34:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so10573965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793993682; x=1794598482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=UC1d7YNDgoVxJdUHy2aH4qIWPDmvb3yvmWirR4NRtPc7L1ZBw4LtZH+UTc2HGVT0Qi
         pOdJOITfmHjR5r0rm3TrUt+kLjnxP/SnWIMqiM6/NYMICcZYzOCdDG2xohNciYJCXdSD
         2SHRTn1BPt6BIh2mmOQS/81rGKAVZ9XdsYN6GPznyMsgO9rtDkwyiIteKbi5xesTJaUC
         U3m5j00pcaSTKbwzYqpGDY9uBfKke2DnF02Ogw49zuDwRSEhxztFFlyDcZaao2NLLHe9
         4PkC6nugvLQslektUsSBAWclwKXHf+sXeZCNY1CKtinAI+ycBTxrbF7FYybq5YaqNR5/
         BSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993682; x=1794598482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=TrwycCQ6hv6Nxnmxzzo32hDr9cMF6itYGHQYY8+QxC+xRoqpIlljLp4rvQECEts4P9
         AL286XeFTdz5oMAFncIpw0pAc/uQkzJIve+OnEyWy5IVhp5HR9h0Y7kjPcPIRH+kh6Hj
         O/+y6SvCt9sDObWruwCYaGgdBQe98Mx/rzDthjXuipDmNhj52YHOWMXv9grRKvQVKoFc
         qgpu6+dKdhVVLIKTKnNx3WkYbVmcUkEWW0FQOWQVDi7SpRPlldCInZ1tcnYL4I/tCB5b
         hjRd761r4u5cJhm9CWyO+eSuGzncFZ/7L3xnqRrpi2O0qJ4WHLy5QMoBqA53G1w4rBcN
         /rnQ==
X-Forwarded-Encrypted: i=1; AKwUvByT3YU0uvr7+uNVcUeiEdEwgX234+Q0MdX6GIRG14X8GTWZuFkISEps+Lp1bJK+UvyBEYvpDVWpwJIkw6Wi0fId@lists.infradead.org
X-Gm-Message-State: APuU4Z9/lAFHRLxkhecD7CRN7XB5vLhnWFJbQ4Oi0UzZ+qJtDGXHvwpD
	mEP7bHhrYH3tKVHtG4JuekwGqTlf8lLp9uYltHt4fglHY+BOdB2+EVmSYXmS3obIS2c=
X-Gm-Gg: AYBFou0ZJsj3JKV4cRKlxlgIBpM8wJvzvKwDKZgG1CIEGONHgUwz9taUpIOMQRPoJgs
	TM0tl3y4TLvOpaUYXLgGPseu3SfNKuofFeT0D5XOlaoQM7tGxBSFLK6i/oQp/3xR1AZZTBZyLsR
	IZULJIGuemmXcdwhXWFLAeg/5NusYF41UM4ypntbuUpQPhFWs+U6oPes2xOpnerkZdgMQG9gAMg
	1Zksy5m6VBp9GmEXD8Z2RwaC/sImJ0vtP4uAIfUZjdMmfxriAocaWf8O8GrW5SoxUJ9sLdRtnoo
	WvXSJeoRB4majcJtunKDgZBDC0lt3GPmO5R+ZtOdfpHCIyh29VT2xeBv4tS+62xWjthYkKeG7cE
	FbYDOaZticqGu5DQUY80kFfH+Zhl4jsqCJhU3VWFtwWp2qJxL3gFjzzHjaVV8JUc1xypLbwlBC4
	NRJo2LhynI6SB911x8ujEtiDXuwVkXZfnkq6XTH2yJzIdrrVmyZyo6oO3YuKFQx+883eV1r/prq
	pqR69dyBXyfNFzi1GkqVvAGZAmEesxVW9jIfexfUzDP7LvhbFq83n6RL4uCUM714AVzvkNlGEhi
	4V5zpUe8RUkFMiqGi0dKIs6iG2FVqjFbMTVQCfcd7kXiq8p24ms9gqKDHghBYIiUnwOlRJpS1ED
	FEGsyYXqf6h2fGTbrBXieXMoj6vUb67Wutg==
X-Received: by 2002:a05:600c:3e0e:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4b6dfba9199mr64477945e9.23.1793993682189;
        Fri, 06 Nov 2026 11:34:42 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm3329295e9.11.2026.11.06.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:34:41 -0800 (PST)
Date: Fri, 6 Nov 2026 20:34:37 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au4p0xYEFkgEU6T4@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-unwilling-preoccupy-156dbb310448@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_113445_113461_5DDFD93F 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:

> > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@0 {
> > +            compatible = "amlogic,s7-peripherals-clkc";
> > +            reg = <0x0 0x0 0x0 0x49c>;
> 
> What's with the weird numbers in this example?
> 
> Examples don't have to be real, but when it looks like this the
> immediate thought is that the modelling of the device might be
> incorrec.t

The numbers are actually real, but the example simply lost their context
because I copied the node from the S7 dtsi (not yet submitted), where
the controller sits under the APB bus node (bus@fe000000) and the bus
ranges make the addresses relative to it.

		apb: bus@fe000000 {
			compatible = "simple-bus";
			reg = <0x0 0xfe000000 0x0 0x480000>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

			clkc_periphs: clock-controller@0 {
				compatible = "amlogic,s7-peripherals-clkc";
				reg = <0x0 0x0 0x0 0x49c>;
				#clock-cells = <1>;
				...

In V2 I'll use an absolute address for the sake of clarity (PLL has the
same issue).

Thanks,

--
Carlo Caione


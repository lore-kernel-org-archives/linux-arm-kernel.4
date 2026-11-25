Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Heu6DgXg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdoRAZrK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=; b=Heu6DgXgQhPfeb+6yLIR4zsk9Q
	NLwXZ+mM4ggNhk5ny3p95Q7speelxPk1/rzFeSon/DtDmND3HUcdYsXZplmmRnXWeLHPHw6UC+Xp+
	WPUSuTWZQBhrNKohOIR70oiJLbzpOewoE5E6lB8r83LASgYDhMxNC8hFJpBTIei5Vd7Bj80qX8bGy
	K0vnxX+l/AH2fhrKn6zEkLZXqxrmefkNNuhBFqRz4SXVpkAdnWLj+mxdlXy0BdjKhT0GOO6kTHufT
	ut24nW8n/5NxUGOjkOSwqa5Th7eGBIvI9VFrSfWbKQvjUTqjTe0ZRHjCVpU3eD1aKUVL4ONYXQopa
	QAaOhhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEqt-0000000AKpJ-2hZX;
	Wed, 25 Nov 2026 15:24:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEqi-0000000AKlA-0i1s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:23:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb995ade6cso3771425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620234; x=1796225034; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=kdoRAZrK27M7JaFzccmu3sUdGGzXOf6/mq9MnzqPbWcciKX1BOPunsqN0FCvy1YyR4
         SoUN0Xy1j6Um9Ik6XpB9CY2MT6FGZtFaqIWym81sUVCDFCX6Lalzo1rsAGAGTOOq8eGE
         srMOBhy7F2Rpxxho7Ek7h9s3ogF7WXBoPj4wS3PB9tTiNlsuSguDf5tCqEMMX0AKamoE
         qvzKDXLT0O93jKU+CdLt3YDO2sTL9fYT7V57MXPvCeKnmqLlOAy9mlo41rn4jWmifPIP
         RdmfMkLgwrpGJFEqtoUAYxsN029+TlmquggdzxATNZRFYn8jaSXdkQftWQql6VpSpmxl
         ap1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620234; x=1796225034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=WEOr8v08XuWz+d0ffctg/LARQCMp+2zfJJPdjkDDoY5TstKHpDAMGmEVNm+RfPRNdy
         qNrvaAEBlwD4WtfAXL6EsDBUUhuieFcah/R7IsSOAp5Gih1sUsW5/WegRUHldJ8So499
         NjCelgFZMthEKSq6B6yjUkxjbs/VZfCWd4W1oZTwcqQU3aDjdYrv2SHUvn/hWlSH1MEw
         eIx5OcxpZYSKpsZijhkR+8dKPUpGjNSmlO88SVjZAR4Q3E5GAnI7wBE+ESPy9Se11ITr
         F0yU1LDct/Ng/3CtLO2g2qnWR4c7uuKvXy3ASvsPqyAgQXOAPrBsWUf7ICvEYxcUOalj
         3k3Q==
X-Forwarded-Encrypted: i=1; AL+hErG/k66Y2B0Kp7MjXJaMJL4Sk9DVPCT3E/fYcUIe8UqBS2PmIur38ZLgVhAAuXj6qLaX/yhby7y/tX3SGzDB+gUY@lists.infradead.org
X-Gm-Message-State: APuU4Z8dlYuroCmkHtiiNUcrs1anDai02y8h2MRJY0PBZ2Zp6WwqSpR2
	ZxS36R6cTeNJ4o37bRAT7G7mag5+dqXKzOT6lX5DI04qPYDlX9gY8EiR
X-Gm-Gg: AZFdTZdqgpmxh3VsWZLDeYEQF0wWZpJ+FZevMTUmSdN1XJ3c2YFbJOpkmMloz7ak4ki
	2MG3qLASPq0fNUw6jSKaow0cb1O3wbNlLe21SM7SyI1BLSa7yI+tT6++lZq3xoZP6QBqN78O0Qs
	X2I9KUe/In5uGMylInidhpCf8BdN5Ia8QDuivgUlYja3GwV17W5JBmk12QQ7LvXFqowD7+uFk0I
	OYYR2bvBVRwCFlSRh9t338cxRKEO3SHIR6mWbREWD5vh2ejRWCRztOjykpMRT2l6QnMBjFfo+yF
	1n6HTrF89bRC/MyNeeBzPB2aFlJe0kQljIglCMBR0aOeH2bZ+YCwX+v6LOagBAh5njdu9x5Wu/6
	e3Dov/0Ir5COVLoHQH98LdCyRGvztTv6sEsLVcNqeeZNOW5ywLWYI06UAwz8Rc2eO6SLiowfumY
	jUw0abRuTwqkvRZhnwM/PfAogAykryIqa6STvLePoIAr4XReFZjJp2RuEFethi7NFO8csVEUlNo
	RfXv+j/QoCVZXoDvyBVYl7PlXtVqGH6JidbJFv+Xu5sydW7K9RGs3UXldNy9czpwBFMOfhI1VRa
	JznRgBZHsLn1vHQcw1Rl
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr344398855e9.0.1795620233772;
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm316515815e9.2.2026.11.25.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Date: Wed, 25 Nov 2026 17:23:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 7/8] PCI: cadence: Use phy bulk data api to simplifiy
 the logic
Message-ID: <awb9XRze_e8xt9tA@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072356_304175_B218C4A1 
X-CRM114-Status: UNSURE (   9.86  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:36:38PM +0800, Inochi Amaoto wrote:
> According the document of cadence PCI controller, it use multiple
> phys for multi-lane setup, so replace the loop of phy operation
> with phy bulk apis.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Minor nitpick in commit title: s/simplifiy/simplify/

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>


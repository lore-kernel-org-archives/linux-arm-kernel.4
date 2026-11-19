Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AEC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZSBxqUje;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWIKEsL0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=; b=ZSBxqUjerUi/oQbspDsBsP6YPG
	oyJpRtrP4Ag74WO34dKvr8ApsjwTl9MfjtiA8KkIit970Ec2Leq90VQu+8yYU7lOHyoPmRTseA1Wv
	9/j1fdM3YP/MSGYa+V+xGsDT491JTtPNLFIQWUJF+x+Ui2382LmsFdKnmrkkYJ+EZ4UDtNYPsMR/g
	i3WTYA6FZx/Q+rpiXtmP9PRGmYQB2w/pPxmkmRtyiE84nPLrMtVl2/rq0p0K7H9d9sSF5NvW5d8Yr
	ddfVJcPcfaDVMdNOKLTPyd7mR7T5h5RtijUqd86gTRAISxRYp4oZFwRq8/a9wQv0aUB+dOgohbZCz
	/N0Q4Qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyRn-0000000BOnH-3Gmt;
	Thu, 19 Nov 2026 09:28:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyRl-0000000BOmu-0tRR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:28:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so17411045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080527; x=1795685327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=aWIKEsL0dERQn+8Dpu3nYA8eBnEj3uPyD5fka60qjC3ln6Zjx+PhIF9UnRBe2bwv/V
         61Hf1naXnSdO/FdprLSfHOMQlT0+st5annflmPH3CuzQymNoJamIZKUe7bh/Rzky7hsN
         PRMxAgz0rdueSuG1xVb0stl5LfzX636BmLLKEaYHk81qFJVn0hfezjEOFsKB/DXOWIrE
         sRId56ekIauZJbarR8DLX3GMh1uw/GO38qfPEuyiWtB8o5SphLM/GOJCPbtj5LdaM+fi
         2REHIVTrd1Qszhl/QRHAttkr/9nbKFiSkJBBRpSAsdCrRg2eYi8bf50pwxBAKcgh81UR
         gfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080527; x=1795685327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=Vx7kv2xVhyWpY3vrUhzDjmmkEhZplb/ezs7tCRJtylzpHpz9IkgHSZvXBOq5UX2sAQ
         M9uQvsVDkdDE+AUn8eC3JlF27bBKs47yx6K9LxbkkSZRyU47YQWXnSfAc3GFjNsClsJ9
         wbDhhFlalz/VyHrQPA23L59OzLLtJ7vuC06g55d9XzC0fZRlJxFBcF+VfDludShAmCOL
         MYODaGPU7SJw6NrnwbmKWBWtf1wsCYMQ+QYkJJqNN47yamPnRwnMVuwBeu6MJLwrbVeK
         WHAWa5Tm9TT8FlUFUD58k5V68dZFXbASsN2a90kbaCUXgSbYMgRHGaQVgj8MynYZpxaX
         lelA==
X-Forwarded-Encrypted: i=1; AL+hErFO/Kqm1rwNSWa1JW+tcPcPqOoKYZHdlypKsg70mY4621BE3JFyzgHbGG1juM2ISEQ14Pa2zPzprcoFALCpPRPi@lists.infradead.org
X-Gm-Message-State: APuU4Z/l9hpP2juTW/yA3FCfLXW59HLgu/Rh4ca/RTieI6e4PufOZ+gO
	mfZx8IfFOltatbJueNM8tUzXVQ3ZRJ5NC4tCPNPaaNRHstGz+Oy4RWGd
X-Gm-Gg: AYBFou0E7bY45ToyQ0QfiqM9hlZmbcvlA6cgrq5DZD5lK5h1IZBEtpb/ZGkF2apH2aG
	5Hhr7WY3lvu8DtwnHrap+JONuyeFqZaFCTWxrXnoIidrM0+d5Wesl+FvVg6xSTbB081TSYKn+D5
	Lq+Q2AmyBjd4d8wCAQRO/ZTcteoNkyNXpNW6GoEfuleWOtVXPS6tdEoZ1Y4z1liVAlK5O0snYrH
	di/UltP6IiXhF0ioQiur157IWjRMYv038HN4mR0o6coE1U0gDsWGpqrzeBIiJo0466trrR+YmXd
	r3vrGCZgUI8cXiobwNhDqh1crjGfIq+TNL2zjLrSXmpPKJLS83RAtIbG6NI5xpYu/HRmHWBRrec
	Rx7nsFesmmFkg+Q8BhEfWK1AfZTg1bWJBGrMYi/thAiLZ2yFJ6X26cMb7B9xq+FaTGlavJaaFjP
	Z/hxMN1cNLNA3wYpSXYiZ+Nnlz7HWFhPtoYsKjuHPHiAhBtSsgRI2I8ANSxUBppqPrNsb9TKUw0
	tydS4c6qs4j/ZzUHacWebQogxK86bb4vPVw9q7n0doLSjKN5emQBQolyXfEx3nVCX32OfURyIR+
	+UDvWD7ZWqcoIMZRyyxgCYqpWIZOXwIgwWRZo0XlhjG4LoRlvbq8rX2aexMnhJrOsWnM9lZ33pA
	UzqxOs6M0uWL6Nmz7QBLKFgzVvX6FT2bgrTXM2eiv8Vvih4jw8fy5UgyynjN+Sw==
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr120234985e9.1.1795080526550;
        Thu, 19 Nov 2026 01:28:46 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm8736002f8f.19.2026.11.19.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:28:45 -0800 (PST)
Date: Thu, 19 Nov 2026 10:28:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7BStmo7w4_rPci@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012849_280867_C3547E63 
X-CRM114-Status: GOOD (  14.78  )
X-Spam-Score: -1.9 (-)
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

On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> 
> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> on the Application processor because they are used by the M33 FW.
> 
> Also, instead of disable in the commit message I think it is better to say "reserve".
> 

Hi Daniel,

That makes sense, thank you for your review!

I'll use "reserved" for the peripherals used directly by the Cortex-M
firmware, and keep "disabled" for devices that become unavailable as a
consequence.
For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
for the M33.

Does that match what you had in mind?

Best regards,
Stefano


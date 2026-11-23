Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C607606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCGNRHvh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v37dM4rC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=; b=bCGNRHvhwO4xli
	8PM7kTH1Z4FStQO9vYGGLlgQi4jwB2hfz/Drk0KOn6Vc/PrGUt7kozYvpY2/DN5edjrRNMeD36Nxn
	6WJqxk5fcM94zZf0rPzx6pxMvuXuF5Qr/VOcexgBr7QEJ7gL7gDLZWwtMeqIdv7VQHQJErcPBvSPh
	6cggK4dYxPvnR+bf6uH/LaKcwJNgtHn/dX5kZ72E97u22ah4kR2GpVLqQKLHTiHY+Jk4xuvLhCSaK
	tq5C3UCMCeQzv0OzokCJNVynnMsLESivDP7bjqI/9HxAP7ber6lIaa19meYsHQsqa6LRK+dSGZfc1
	jp7R0lpBqDyk9fKzN17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbQ3-00000004x0i-1cW3;
	Mon, 23 Nov 2026 21:17:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbQ0-00000004wyq-1YZm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 21:17:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1785930f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468662; x=1796073462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=v37dM4rCQ8S8IaVMpFqQYwXkZDG2MsoGLGhJBlCTxgJ65OvyJMc2fN6lnphy3+kur2
         7DAwO9BHt0x60cBnROjqSOJQsQmaSD+Ng1sa7cWpQ5b61oeWQgDQdRqqV7rZp2u064n8
         2k25JOo5KjI11Szw5f+wTFCZmb+49bep7gj8m80iRHnvzgOwjkzAlH0eAFCQImnuR98b
         fEyrQunyov3Pce30qpbBzh26Hr0NR7cH1EU0HADVeDIxh7KPAkHC+vDPykvaRwwVzfDw
         ni2wYAfmpWnQ1x85i2OJPJ0G5z6r+aluYsCamrnHo5lcMU75HAXf1gdMILz17onEpJkP
         j3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468662; x=1796073462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=tBbq4WHRrmVb5x/bjmLSUOPGlx8YcIWrg3Fr49GCwrDKku/fsEli7aHl/44YuVyLSS
         4yka78mR4hc3/erZibm8Pkd8S7Ph1m7HTnLCeJ5eBTMXNGy+HjdTJM4Ak1CwqSq27ybQ
         1xSXsit21HaP/Htf/LcPNy+f4n2xYd5BMrhvM2INw5aQWYMhKGxKICs07UDeosAg/dIW
         O8ERMSv08Qgf8npmaRsWfgY0iEJKgkYdqu6EZz86g59PmEK/zcCwDM3RIoEdtLqUh4F0
         blfSND//iHfqCB5xXGmiLJZOA5Wdora+uXOMfSUuJJsz2ewwVsht6MZtm/p9ZQoWNXDy
         /WyQ==
X-Forwarded-Encrypted: i=1; AL+hErHoT7AzE6P9NuDqH0ZwakyA7pZFR0B/xUDtEPRCPqx5hbqZBy9RnRau31uirMOiFOAv854U6RO+7XMLq74G0nDM@lists.infradead.org
X-Gm-Message-State: APuU4Z9mdxwZJCNcRWgg8WfyYaSIFrbnlCX+UvIrjpNDc0xdqvDM+23S
	6AZCStru2YIr9Wa7IPXuwP4PaKKX2D4i5eG302GqTFF3TlHFFX8V5dr4
X-Gm-Gg: AZFdTZcu5YLdghFVFDSL8ZhD409AqhsQY8bLEwPD8EiKltPQor6bPH6pd/YEixzkLvd
	o2ALtu3HMfT84VpubfcA68otwERv4fGunkXjz7rz6kmelvZmOmg7utcg7qOK7ISuyhP6jqJaqkV
	IBkOSo+IWnpnZFm9qnrw2bSqbzWLwVdUIRYpgy7ii77C7Nxu4gxcxsSlolBy7mIRGyHXetKh4Ez
	//eGNtuUrc0xtoppun8XHeG6+GdpceokwKDmhtShoMcPKtt6VUubvKAYKrCt83ltRZPWuwcV0lq
	hH82sTiehxr8sJtqSRbBrXEd/6r/3oXLEhlELJ1Pp20ys2J/1Su96nWA9I/rEstJqdlVkSTk0Hy
	pIIgQ2mgLJSfssAA872ZEWg8EXAMYZMDM4dTQC4C8vjy72fQzcrTmuubgW59jUex02FRX9+OLZ1
	cuYXLZU9/pF9DQFyaQc0906Irr70KjkEwFoO4+Tv5gvxL6cBewGJtKapSmxyNBRvxgp4l7mV4Gd
	yNMAjX4rL8HLHi3VvF3IddHMlD4CO56QQHyjGKRTnQadxTvJrkTruT8O+U2MApnsnfFvuYBbGtZ
	O4B9u8ytdd+fSD9qkktiALwxeLhn/fgEJCeqkO1Qhd32sD3D
X-Received: by 2002:a5d:4605:0:b0:4a4:14db:2348 with SMTP id ffacd0b85a97d-4abb29105d1mr18698069f8f.35.1795468661504;
        Mon, 23 Nov 2026 13:17:41 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm24513121f8f.6.2026.11.23.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:17:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Mon, 23 Nov 2026 21:17:23 +0000
Message-ID: <20261123211723.1065310-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com> <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com> <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_131745_080148_A774792A 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 01:09:26PM +0100, Krzysztof Kozlowski wrote:
> This should be rebased on my patch removing the IDs.

Thanks for review. I will rebase it, but I am not sure about
the order, could you please clarify?

1. Should I wait for sending v3 until your patch is applied?
or
2. Should I apply your patch locally and then send v3 based on it?
(but if something changes in your patch a v4 might be needed)

Best regards,
Stanislav


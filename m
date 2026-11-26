Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3699606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TPcnVJ4g;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RzUt/cFA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/1dJn4TAdBA4XljLfYsGFbvNTFReoQoHMmfJqvxrooc=; b=TPcnVJ4gXQ0D7y
	i+QaGgwWKFndcFIoz2i3E6hYg/zyW79CuE3LhI0L2YqJ0tZehQFwZbZPOdbsgEWml7ndqicDUQQS/
	z8+U6Pc+4ilU1Wc8Ez4ZH/yzVdp3Y/AHJXH5FNkwfwbST5B0VgcYGjeEBpIVImC4dedXuQg4fXMGz
	T0zKp1LZeePmJ9WybInsnqzwS54Oz4lbfytqynfAoxiLneQeISyZJ4W2enB/IEgfz2odGkg08tPen
	oPbovd9wjfFFgu5+bssF3MKXpGVMPo/O/kH0iVFuYO6/tArVGNGr/BNgnkk0TJZO4c/isBlRENYNu
	4Vzg1WJQlm+AKaHSxDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbej-0000000Dmb3-13Eq;
	Thu, 26 Nov 2026 15:45:05 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbef-0000000DmZK-3JfG;
	Thu, 26 Nov 2026 15:45:03 +0000
Message-ID: <57d28bc3-04f1-4a86-ba9a-aa851e42610b@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795707894;
	bh=04dcLTbLWG5N5d7t79/Zb1pDQ+FtO2giwNZpa42wm9Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RzUt/cFA0YHKfXN4T41/CPi6x2ah6O7gE/XstF5FnOYX1T84uet60DKZtR7E5seTg
	 HFpwgcyCVQTGtMh6z22U0zua9LkkjUIJ3vhk/Gx0Gt1ftqGeS5OSG5K3LAMkWfBwby
	 PhIGC35qaKLr/agm8X0j+s2MbCFx7wG8pYDtL6cA=
Date: Thu, 26 Nov 2026 16:43:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
 <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_074502_281681_B4C11143 
X-CRM114-Status: GOOD (  14.07  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 13:04, Ulf Hansson wrote:
> On Mon, Nov 23, 2026 at 8:38 PM Ronald Claveau via B4 Relay
> <devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>>
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> When a power domain is found already powered on at probe time (typically
>> the VPU domain left enabled by the bootloader), the driver registers the
>> genpd in the ON state with GENPD_FLAG_ALWAYS_ON and never calls
>> meson_ee_pwrc_on(). As a result, the memory power-down bits of the domain
>> are not touched.
>>
>> pwrc_ee_is_powered_off() only checks the top-level sleep bit, so a
>> bootloader that enabled the VPU without waking every memory block
>> leaves those memories powered down, and nothing in the genpd framework
>> will wake them since pm_runtime_resume_and_get() is a no-op for an
>> always-on domain.
>>
>> This is a preparatory change: a following patch drops the explicit
>> HHI_MEM_PD_REG0 write from the meson_dw_hdmi driver, which relies on the
>> power domain to power the HDMITX memory.
> 
> A question, is the target to drop the GENPD_FLAG_ALWAYS_ON bit for
> these PM domains, once the consumer drivers have received proper
> support for runtime PM?
> 

Indeed, that would be the natural follow-up to me.

> In any case, this looks good to me! Do you want me to apply this via
> my pmdomain tree?
> 

Yes please, that is fine to me.

> Kind regards
> Uffe
> 


-- 
Best regards,
Ronald


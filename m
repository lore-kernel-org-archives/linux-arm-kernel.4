Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dzd7dO1A;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=gU46oP6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2TWoWAsm1Apa3orL/Yt0L4YfqkBPFNcm/0g6RUQ3LYQ=; b=Dzd7dO1AlkOQJj
	jPfOhMA6xC/gJHQYj2YjooHbu4FtC/JFHrYAJua4rzJlJNhw38V2YXq2GvjAwNbGQ1ZKZkxs2Cgdz
	aeaLCtfO9lFMCHMFXkjEjBu/F8IxSmFvP9JWq+ssfosHK2gwPdBHJ7LUlXn5GdWG0Duf18HHM6j1W
	CUUMTRbidw8chDWJ/uEZQhTwoJc588/tugixlEfFf6m/jO9+LczNbjpSOsm4Ler9aqDAN9ZfCEPRM
	RDwn3QZfiIIPEk1mh6gMbgdbx/3NLohc4KJh0TbeywSxw1psJ6bwWA2wB8qDnlE4otbwv71YQ05ei
	7e4cWrWhTyPVUD4Yncmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFLk-0000000ASn5-0uGM;
	Wed, 25 Nov 2026 15:56:00 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFLh-0000000ASm7-3Omg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:55:59 +0000
DKIM-Signature: a=rsa-sha256; b=gU46oP6B9c4ypb6Im7yWc5TxHA9zpsJAykGWLcCYUKNxyioQJFo72y4uY+uWPDrzoGz2sZ2sSqIox7MDXPhmIblfpqZHbyJcF56flo9yb4N7w2lZJd4mMnKzRWlss556gu77NU16hJ8AjeQcTH4cVEUm7Ei7jVUhWQiX38He76YCq7QNcDTbtxoYhCI5nh1xjXVzJ43fgF+6/dg2wn12ln5JKFCLwTgtBb1RvZYWEg+FzHNOLP2NPtPXkLi0Xr0c+Q4NKqTWtglz59bxbndl/VkJ9ZbLBZVFT72tk509S8omYPM5HalNXtpZ2B4eOtGvCJU4RjM2SZZ1aWYQO+BIjQ==; s=purelymail2; d=purelymail.com; v=1; bh=TnfnPC1swyrjuv/n2UWWnJpupbzh/7OS04oP4lB/JOM=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -532728891;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 15:54:27 +0000 (UTC)
Message-ID: <f7a64060-9e98-422a-ae2a-1eeebf8469e0@mentallysanemainliners.org>
Date: Wed, 25 Nov 2026 15:54:15 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Henri Ommer <henri@ommer.net>,
 David Virag <virag.david003@gmail.com>
References: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_075557_912295_EBF48D07 
X-CRM114-Status: GOOD (  16.99  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 17:14, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series enables USB and FG on gta3xllte. All is tested.
>
> DT changes were tested with make dtbs_check W=1, and the dt styling check
> scripts with --mode strict flags, both of which returned no warnings.
>
> Please note this patch now depends on David Virag's changes for USB[1].
>
> Best regards,
> Umer
>
> [1] https://lore.kernel.org/linux-samsung-soc/20261123092244.1792040-1-virag.david003@gmail.com/T/#t
>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
> Changes in v2:
> - Drop patches that are being picked up updated and corrected by David
> - Link to v1: https://patch.msgid.link/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Peter Griffin <peter.griffin@linaro.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Umer Uddin (2):
>        arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
>        arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support
>
>   .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> ---
> base-commit: 9b369f9debe1253032abb90a9469fe44146835d1
> change-id: 20261119-gta3xllte-usb-battery-b95e4d89ae85
>
> Best regards,
> --
> Umer Uddin <umer.uddin@mentallysanemainliners.org>

Hi, dependency has changed, it has now changed to David's V3[1], since 
this patch

still will apply fine on top of his V3, I am unsure if I need to resend it.


[1] 
https://lore.kernel.org/linux-samsung-soc/20261125145458.2594179-1-virag.david003@gmail.com/T/#t



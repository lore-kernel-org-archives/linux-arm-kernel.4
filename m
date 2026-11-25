Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D78606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ho6maW3Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiuxPtFp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/EnrdYa4zjUO8ROpigORKfRZCh083G44JPXxwTfqGkU=; b=ho6maW3Ye5nC+zEgPbeb5IfpKr
	UAzX0x+FU47Frxr439scumDSoJXqf3u2uAePZc9DAEq9+uuL5d82CgtvLqNWYrIywGpjY6cprsUq8
	z88V2Y0QDmPbyY1kVdtaV3RpbBxwTESdEIxxlJf/MaRtfnWT2cyLWshV2v/NAxcAL2Q8IHITQLpTx
	MrT0Gj10V4nPY2LyWh2w9eI0ZA3TfYSwgs5pZXKTd3SjwUoHYR2FlygGcp1eE2LH1i/LYjY9+x6n/
	4DzhIeuylXIGbTLGjg21ShCNc3dcIEh3l1kLotYKZReNZ4UBKHBynHWQa0KzTDyox1xSPAcbsunfK
	1uI/qubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFI6-0000000ASKI-3UGy;
	Wed, 25 Nov 2026 15:52:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFI4-0000000ASJs-1ULc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:52:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id C967B63325;
	Wed, 25 Nov 2026 15:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9F44C1F000C4;
	Wed, 25 Nov 2026 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621931;
	bh=/EnrdYa4zjUO8ROpigORKfRZCh083G44JPXxwTfqGkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QiuxPtFpAingxUV4CyMiNKqbY7tnUAqs0eoyXpv+sCCtBuRTK6a07o8hCOglmbm7J
	 RmxBA4Mjr8WOQnG8+rMPT/a1Wo7tVk3ic9xQCVn3YHUW791TX3Ms00kInEobB8rxSA
	 1d5DF6jB46axA+4yFSuaysLMeC0AJysbfkvKFI2SPQNhDJYehwqLxCaeUZXLvhXOBC
	 UUNZ5OKz6z6LgaXabE21Stgc2df/Q6NTnpImSLsuwhVfb6OBjDcw38DbxsNnB2yCkr
	 iQWh/7mUqM9xUmf44omKOAdWZWAdy2O3LCraw15/qnJgzTw5O4/PdZtM7MPCq1uVvo
	 zy6u6luQkLc+A==
Date: Wed, 25 Nov 2026 16:52:07 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] pinctrl: scmi: give no groups to pin-only
 functions
Message-ID: <zl45x6zxn4es5ynt65tbhzpmkqximjtencit64vjtkcoaosbbr@gtq4jq3ndodw>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 04:21:27PM +0100, Clément Le Goffic wrote:
> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 


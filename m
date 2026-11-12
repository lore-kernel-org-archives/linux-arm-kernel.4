Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A61606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=20BFTifF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZA9sF07K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TbbHD4go/dfhhreSJi7b0LnLM06Sa55RvHaM/AMreFw=; b=20BFTifFIU/CE+ZfFqKCUHa7b+
	UmKbz0oVipaoPMZaKNUrX1UWcbrxL76kcQz022sSErmArKQM/luNoib7Erkx8ix3LPw9JUZm3Ffyl
	Y3C6q9jU6EaGMw2Ooa5IMPOVEgkX8T4YPBPd1KSYDRZMFHw1Dq62Ntytlrwdxlx9C7OZeczir2tYb
	3KFTYhakPdzNkCVaiPWJlEcgQ44DUJ/Pa5Y71yAc7wbQ9isbE0wG7QhUYNdN/mfYJp6yZKLiQS9+Q
	5SCoE+1SR3MYdpJVug+v0/KGndTDfiI/h/hw/Em9WsctTbb/JtNpN5SB5hgUd2iRsRIJ0pv+FDkR8
	H52BPeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXSz-0000000AZ8b-2Mra;
	Thu, 12 Nov 2026 16:16:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXSd-0000000AZ3i-3sjK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 60E2862316;
	Thu, 12 Nov 2026 16:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3CD3E1F0092B;
	Thu, 12 Nov 2026 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500139;
	bh=TbbHD4go/dfhhreSJi7b0LnLM06Sa55RvHaM/AMreFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZA9sF07KGz43c8vwZIoQJld7zvItYI/ivho7DBCXqi5ELSxzTRTuElkmYuYzr809G
	 5jSgWa6e2iCnBXGYyXbCvCUF3fiTAIykKj+JkMZdw0IN0w3elwEWuX/qF9+QLxNjCR
	 RV+hP/R098nxcRrv8soKuE6AOVaEX20jPRMEWxXEpa0GZ2sNZV0JDnf7RlrRfHNgv5
	 2mHGL2YynE2gdVhkU55ji7XQWavVQa5RAyLMgI95zt+nmy/ykh1vBlHWQBAnUjc9rC
	 AKnWW6DPKRMuXu4NnOe/GxjX4pu8VmGIPnpruY5hdPvC4Dq5gWem4DmHC4h9CD/5kq
	 64tXAT+67sGuA==
Date: Thu, 12 Nov 2026 17:15:35 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
Message-ID: <dgeoiuzefy3dc2adw7b4m3temtxqh4upfca4tcwd4vgk2mszxm@2royrbgneufv>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
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

On Fri, Oct 30, 2026 at 04:58:40PM +0100, Clément Le Goffic wrote:
> Use pinmux_generic_function_is_gpio() for the function_is_gpio
> operation.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


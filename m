Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219F606A8B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Je4Nm/2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFmfv9Aj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FE4RJwnrzj/juNXS/pesyp3PaSMEL7UzGYHpGBwwCZg=; b=2Je4Nm/2PasFU1
	3jDa/vnHLrOes7Vt8kQKSvma/o6PpiE5YxtkqaeV9Dfx064TcXICqNmGbElZITsGBxZU2ZqBpDnwM
	5rmGP1onVSSWKugWfqRNJ6+CWpYZ+OpC1Ai8jQX378Mrhk4Rp2YUw4PMdPiO7cKbl2MO/ve8J6TaG
	KE9ffqdFQMjquXah0ugXQv1ClFcXrHRPzgr0MW+xBxvwbwZig7+fYL0DSzXHZoSWg9hK+EnwBfZTy
	BzqGRjSqwF3O7n11LlUa7gSMUt2uKY068YFm2V4ikZ4aJRWTsts734lWh9b3VLc7+S7iGmwGzNy/9
	mJyeqncg15yfGQ72+M2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSrZ-00000009fO4-1TNl;
	Thu, 12 Nov 2026 11:21:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSqw-00000009f7p-030Z;
	Thu, 12 Nov 2026 11:20:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1722C43669;
	Thu, 12 Nov 2026 11:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0A31F00A05;
	Thu, 12 Nov 2026 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482425;
	bh=FE4RJwnrzj/juNXS/pesyp3PaSMEL7UzGYHpGBwwCZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SFmfv9AjkY55CXOtjrtFSwkJwjsJ7hkt0Py4imkOR3MKAIbz/XmktVMUndaIhdrPd
	 rH238z1DeQMNsIQExdku2cmVaKF6gnfGw9BYJUvhLKSGBqMIQgMn4fMMKE8s1qObZb
	 zHtl5kTAMzVUNQ4eZ+RRACXKToT0G6GaaMFY5ALNwbx1wdEmAGhTY7wxs3SesHeq/V
	 NOZLmO6LfU6om0CIIUjstFUl7w6g17cjqi3FaYLX7dxxRmrzUCMEAAn/Eccwatf1Zn
	 t2P03i2YLED0oHYs7Rs4cqGPq/pwD+TSEnxuomx8qzD2L0gm1O/C9VWqK3+3D8kI8F
	 TCQJd+9hezKsw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021102155.609575-1-diederik@cknow-tech.com>
References: <20261021102155.609575-1-diederik@cknow-tech.com>
Subject: Re: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
Message-Id: <179448242246.492462.10363037701797404099.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:22 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 21 Oct 2026 12:21:20 +0200, Diederik de Haas wrote:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
> 
> 

Applied, thanks!

[1/1] phy: rockchip: inno-usb2: Remove redundant dev_err()
      commit: 4ed7bb658700a8d47d7256330390c04fb5cf2d2b

Best regards,
-- 
~Vinod




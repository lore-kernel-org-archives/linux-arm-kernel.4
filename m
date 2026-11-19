Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132660A260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Zbf3T/B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gzOzWPps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gr3scJKYblYt8hkQXGBXS2UVjgDcDlRvwPn5vvgSOJw=; b=2Zbf3T/Bmlg0dw
	V7yokTepwWIHju0Y6jEmS6LBwU75KHjSjor2EYnmyrOIQ4mdSowC2Fm4M0Fqw4yW2o5EnB2fypJaK
	TsRYtsv+7BlOsM5hRf1lIT284uUVZ+DNHwzizYoSOwT0ocvJqPCjBiJhCE9UC0tUn17ziA7yj4Hyu
	u2Ro5Q4Kk6BbzDyP+QiDoZGC+2ysJE8TmIYFjFZlcLcRnA5q/TCt9IBnx42Of4S4jJPre0bYgs/gf
	0fOKm80YMinDvqNRa4GlqwbaEzdXXdINJMxHoaQxlj2dfeAGbRZB62HJZFPj5big4uhsdm3YOaLen
	t77gaK58E9ffaWEWpKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rj-0000000COY5-0vAV;
	Thu, 19 Nov 2026 15:15:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rh-0000000COXV-1Iev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:15:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C0C8626E1;
	Thu, 19 Nov 2026 15:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851811F000C6;
	Thu, 19 Nov 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101356;
	bh=Gr3scJKYblYt8hkQXGBXS2UVjgDcDlRvwPn5vvgSOJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gzOzWPpsm+98UFdUenzwQ7Ub9Z+HQ5omuud6nT+PFAAaES+p8OKSB4PBNLLdDnGux
	 K4FhNQwuWhIAz0rRCeHZFPfPr+Zki7W6Nxzseth5fXz3GirKPOynodbowmCqVs/5hN
	 SOIlNGHFwEomONw+950HiSnfL00MwUvAQY7mk7zOz4rEdfBIdBhl14EyZCtCd4gVbQ
	 z7MWfy0XFl6g8LOYWI4Q6MY+xVq11eA3t06KVvsSSW0ao+rdbFxUoYvGWP4u5n5axK
	 WZehRlXhaK7z7mvGM2lD+OWzb473C0Q/Q5K3+gc33WvkjxUXtkCbcm11vk2wrdIdIN
	 Xq6r2GiQakovA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
Subject: Re: (subset) [PATCH 02/12] dt-bindings: mfd: Add HiSilicon reboot
 mode syscon schema
Message-Id: <179510135429.60184.5824815095901350208.b4-ty@b4>
Date: Thu, 19 Nov 2026 15:15:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Wed, 11 Nov 2026 13:40:12 -0600, Rob Herring (Arm) wrote:
> Add a dedicated schema for the HiSilicon reboot-mode syscon nodes and
> their reboot-mode child device which are missing a specific compatible.

Applied, thanks!

[02/12] dt-bindings: mfd: Add HiSilicon reboot mode syscon schema
        commit: 421399f733ed842d03574ed976802e9d784ada91

--
Lee Jones [李琼斯]



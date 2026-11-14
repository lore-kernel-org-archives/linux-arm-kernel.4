Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1D606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pXnLJWF1;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BXFMtgb1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=; b=pXnLJWF1lvAN4C
	UTuv6+XRILaHl0kedulHiJXuYHgdjQV37gpdEJiT5gUZgkxbDaYT113EGcj0l2GNrRsLjNdqmdNSg
	V82ChQIGmJPiB954R+UMzBog81IMQO9ivOgUf9IVBW8cSqJ5+R217wDFnhONDvRKVP8GOO608NKsb
	5EjYeQtHqs/afaa5flHYVMH+Ktf9bcyQsGi3CF/CAY54CS8rwE7CFC9ddJUxE+LIkIBYWCBYwhMnb
	eCU+QrciYc3q6UcXoXgpesqJZkPyuJXOkbmhvOOxTYmQzPEmPpDvvEwhyrD+Sx4lX1nJ5v/9aOmRm
	qPd+6TN05sVqDT5Z7hqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4QK-0000000FG45-2pfI;
	Sat, 14 Nov 2026 03:27:28 +0000
Received: from mail-ua1-x964.google.com ([2607:f8b0:4864:20::964])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4QH-0000000FG22-41Cw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:27:27 +0000
Received: by mail-ua1-x964.google.com with SMTP id a1e0cc1a2514c-99911ead46dso1841445241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626844; x=1795231644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=cEhj20RTQ2Cq9kYkW03lwySiBsErQtPSrUmqEzhtZPUI0rLUod+S3EwCKoDXs14/KJ
         DhkvKHdSZXXNd+tFkxzXO4YHyrhsGhgb5gE3Kc7eMotJlcx7U9fQnjx+WM2IOnzHvfms
         Ejtqi4xIYfZYNp4cxtyrh5Bht6/ZBvAiZ9UqLTmJEjEm1HxEinYIVW0WCDP/+DauBMWV
         woGaBVkmOXbshBDg3xxYZqlRYnI0gXzxScPwsGaMGLeZ5ECkU4Qcab/PGphRi4sU7z/z
         opG+AyUhFhbSbdTD4xMGKgHfCSIWaqJpzdANPxR4MQOqLbwPDrCcv6XINUb81BWHSiny
         Q8iA==
X-Forwarded-Encrypted: i=1; AL+hErFngd4cneR1f8BBRkPcutzTBzHzrFFAiXsz4Hs8e85LJR4WTftbWr/t2FpUYLoTpxCIuyJnbmrl5swneGOVfDV4@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z+/qUNSDquH0EtwOWiKrZBPMbNv+ZUvHRe99i0q8dy4eq3lU9
	OQlxfD79fG5xthP5bpPkZ1s/67fBuvWMhXLjQhV9QDU+qMh62I3oHa1yfBrsV7ToOjiF6NILjHX
	zfMp3KkhUFDSG/HuINxFChDSysHU/q77M27ZIguTOKh3gd3fGVvu0c2t2Z8Ys3V+Fum7TO2xDuP
	VVz2jzCCY9TBX+ea8mChzwO82H2JFPVGJA8Yx7oBDOeFs1+Q7WJIQrigmabSMpshCVLWr8NlI7X
	I9yGZXBkTPli5l0pGMbyEhyvQItHj3uGlk=
X-Gm-Gg: AYBFou3jXe1yjkUT9Gn/S/EPydNslFVh0wUyauwh1/sWuz0aoOzgQoDhE1uD3wyx2ji
	2OkJQ6RbmzfArr0XaCOpF01x4lyRI8tn5BfzD2o2odtrnmhhRpL9ClXp9poEnM8jgZT5SU2deXb
	TExD7BVGt8H+qeoEziphEJRP0iGSIXUFHa0UM4hJPKoIxXN3QekEpjfZ42wAwa5Ovva1nYi5r1u
	bi9y5bykFCsVsiNomrtoYH3GjTt804PEUGs9FCW2gqeQu0wyglc/i1Hy+Oj/k1LELHKVB4lSlKT
	xrOuTblKOD7X+x+G85rlSkiDYl6MhlNR997um2rLQhFMzWM2DWrfZYFLyHAi2pA6YjMKaTDWZiW
	MLbC2ZdkVQs5bQ7M7f0WUEEfXPG8RZN7d/wNSCg4UHWqam8qP1LiA1wlH+M2NzMAY6Yi7FIQV8B
	V/GYyxIuJ7Rg8F3u0NmZdTgoQgPQtTtZDcMdTVNahi
X-Received: by 2002:a05:6102:f11:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d64d8e23f8mr1815408137.36.1794626844531;
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c8d2d10desm619736241.7.2026.11.13.19.27.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1975166eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626843; x=1795231643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7KZLQR5brjOUIbxEs4zMrl+yMEzeUF8saSJp6bGvXw=;
        b=BXFMtgb1C9THsVK5LDlP5ttYz0mU8YjdZvPTULRV7CJTzxCFuY1+dgOdRVwFFwf8VS
         ZjqMypj4fAVy72lbnelS7k5SFw0EdVbvrKZowtGYIkSSycn4aroZb9Lg721wd1mFuAeQ
         JNfO2DzNPew6JRaywCp73sA6A9zRNdBIAWz6k=
X-Forwarded-Encrypted: i=1; AL+hErErEFGOvr3K8pCivbou95jA/pthKfIuXKVnrblcAeJzfaU89tEa69jH335ZLM7v959iVp7YipCFvwzKRTqBBnmy@lists.infradead.org
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851041eec.37.1794626842667;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr3851008eec.37.1794626842041;
        Fri, 13 Nov 2026 19:27:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12186736eec.7.2026.11.13.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
Date: Fri, 13 Nov 2026 19:27:20 -0800
Message-ID: <20261114032720.874249-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192726_048037_6A90A03D 
X-CRM114-Status: GOOD (  11.15  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 14:00:12 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema. The firmware allows a 32bit value to be sent as
> reboot flag so restrict the maxItems to 1.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian


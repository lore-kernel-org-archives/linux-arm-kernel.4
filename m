Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9160A2618
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g6dCs+Fx;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YKCrHoAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RKUUofW8j2AR2GX0hv0aDz1CJiwtMVz69tWw+0ZRcQo=; b=g6dCs+FxJFiy7i1ImTIo+NgQqs
	LvMFPS4SSMzRo2rA1H8Tcwq/kIYI5U/k33wLrjkIc47bqci4F6yXH1RF/28jvQK2JsjMJIMut1v/4
	lZh6csJQyWcNdtkWLRGDzbYW/jOkBDHkLE4QWOCatJmOIkAPWcw4yie+DwN0SHahJdQdn4bmMqS3E
	sLgbTRPfyiPcIaZPpAov1SfySBupCf6cuwDYm2ArUFO+q9qj0o1TpdpZ/X7lBffNKPcgHgOkb07NB
	7mgJb3U16hnKMUBMM7EkiOSHNZmy2Y4AQwgHDVdoASO52IVSspRp+WTPLyfjwDpXPGdz8yj/FlwSi
	qfnWdFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrtb-00000004wUG-3uxZ;
	Tue, 10 Nov 2026 19:52:43 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrtY-00000004wTc-3PpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RKUU
	ofW8j2AR2GX0hv0aDz1CJiwtMVz69tWw+0ZRcQo=; b=YKCrHoAgQ5G/IRl31aGl
	Cgk5l5DMsgewrd+DbCHkQcvHPq5KO9se4g3c0KhErCU2I0GfMZh6FlX5UKGrYLcs
	26w0t/QxoTuUYd9ASRC7Ap0bCP/gUFABb1m/y9p14vmeiqDzDSi4D0FMxYmp3yeW
	Uaan6PrN3gV2K/d4JxhnsL8PO26mnL+IJYe4y3VjGRNk6+qLQcuP65M0gUKkZO1e
	wwUlsrX+xok4ki48Xp0IhH+zVFQUBp5Zq8I4i8s9NcdycLn2oRoXoXv3pJNXuFKO
	1WKYgUZRwbBRVRbccVJAUdyiCkc7di3mgh5x+ySN1Y3vOrKVBN8vgDLnYVLpmpvO
	+A==
Received: (qmail 349063 invoked from network); 10 Nov 2026 20:52:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 20:52:37 +0100
X-UD-Smtp-Session: l3s3148p1@rSSaa/FfepsujnsO
Date: Tue, 10 Nov 2026 20:52:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: nomadik: handle pm_runtime errors
Message-ID: <avN2AtdSzB6I40Jl@shikoro>
References: <20261110-i2c-nomadik-handle-pm_errors-v1-1-ea1ac92af8f4@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-i2c-nomadik-handle-pm_errors-v1-1-ea1ac92af8f4@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_115241_159104_C0A68A30 
X-CRM114-Status: GOOD (  11.40  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 03:06:16PM +0200, Dmitry Guzman wrote:
> In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> the controller registers are accessed without checking the return value.
> If pm_runtime_get_sync() fails, access to the register of the device that
> was not correctly powered on may cause a bus fault or other unpredictable
> system behavior.
> 
> Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() that
> always return 0 on success and automatically restores PM usage counter
> on failure, and return immediately if it returns any error.
> 
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Applied to my for-andi branch, thanks!



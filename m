Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3557A606D816
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+TIBsPY;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Vx4J4G9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9fZSnTYT8MA9EbRBaUvLqKYLQu5iORlXOvx+G3Uf2Jc=; b=R+TIBsPYNchOMC+SPm+2vTjOgK
	kKUqBQ8L0tHel608jwmgV/bWXS8fyqADKmLquLB2h1XU97kg533p3ho8llri8Tdlf7yl3r1umSik2
	5Wg5m/rUvFthKlHaVMdK/IOYuhLiqz0EdOY3Ole7/lkaZc6KR46WpbGZgKhV8Aob51XShuwAWvdbw
	VzmyYdluQg2cIQ30e7nN8hp4mRsOFMN9w+xcd+ZWsog7ifN5mMARZpC9Av+IK5Md54x5twsG84Via
	bdhzO8e3e26nrovDsyGCAfzHWIkvlbSIX/iJDsv1Ca0r43FeaFy7ck+r72Qi3B4B9b4dWj0MmIvto
	AXp4BINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhpC-0000000Ernu-3tIc;
	Sat, 07 Nov 2026 14:55:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhpA-0000000ErmP-3BW1;
	Sat, 07 Nov 2026 14:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9fZSnTYT8MA9EbRBaUvLqKYLQu5iORlXOvx+G3Uf2Jc=; b=Vx4J4G9No9bGRJ4Vs0GPjrqjeT
	ToMpI2Vl+Ww2kkw+zMNU1/iDDpUDu3YRotlBkpj9gKNB74bBHTypCnSy/xC6d1DK5LDIQooU3Vn91
	o6AcmQvggAkz/uvzI1jyu03Km0tXEYX8qPdITP2+kuMINdoUeyob16qSdX45z4wObi5ieN66BW4ue
	BlgYsfBOIb2JOxJ6hUKlbwpjiJbWc7qZq7ZNfsQWKZFAPa6g2PANLncMplYImLQAgsqbMNE5yxtfy
	EccGTLdNgh9J4QLQXaN9VRoPbwqYorjGX0D+jkVxeA1ntzsyI4FcN8YGopY6zSra3Nd5Q2S7OUulz
	BvedVQwA==;
From: Heiko Stuebner <heiko@sntech.de>
To: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 4/6] powercap: dtpm: Use generic powercap hierarchy helpers
Date: Sat, 07 Nov 2026 15:55:14 +0100
Message-ID: <4204877.2iPT33SAM4@phil>
In-Reply-To: <bded992091c92baa7246b939f266297f99c8942b.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <bded992091c92baa7246b939f266297f99c8942b.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_065520_801112_4112397A 
X-CRM114-Status: GOOD (  18.62  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 3. November 2026, 05:48:18 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Daniel Lezcano:
> DTPM implements its own hierarchy creation and destruction logic while
> the powercap core now provides generic helpers for this purpose.
>=20
> Convert DTPM to use the generic powercap hierarchy infrastructure.
> Duplicate the platform hierarchy before creating it, and use
> powercap_hierarchy_create() and powercap_hierarchy_destroy() to manage
> the DTPM zones.
>=20
> Add DTPM callbacks to create and destroy the zones associated with each
> powercap hierarchy node. Adapt the CPU and devfreq backends to return
> the created DTPM instance and use the node name provided by the
> hierarchy.
>=20
> Convert the Rockchip RK3399 description to struct powercap_hierarchy
> and keep the device tree path as DTPM-specific node data.
>=20
> This removes the DTPM-specific hierarchy traversal and destruction code
> and leaves the hierarchy management to the powercap core.
>=20
> Preserve best-effort creation: an unavailable backend returns NULL to
> skip its branch, and setup failures are warned about and skipped rather
> than rolling back independent zones. Invalid node descriptors remain
> fatal. Reject a DT node with a NULL path before calling
> of_find_node_by_path(), treating it as an invalid descriptor rather
> than an unavailable backend.
>=20
> When the representative CPU is offline, find an active policy through an
> online sibling whose related_cpus mask contains it. Hold the CPU hotplug
> read lock during selection and setup, and initialize the zone through the
> policy's active CPU while keeping the hierarchy-provided name. An entirely
> offline policy still has no active CPU to initialize through.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v5 (since v4):
> - Reject a NULL DT node path with -EINVAL before invoking
>   dtpm_setup_dt(), as suggested by Lukasz Luba.
> - Document that a missing path is an invalid hierarchy descriptor.
>=20
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
>=20
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Preserve best-effort branch creation using the generic NULL result.
> - Find an online policy sibling for offline CPU representatives and
>   protect policy selection and setup against CPU hotplug.
> - Keep generic API behavior and documentation in patch 1.
> - Fix __initdata placement; match-table indentation is handled in patch 3.
> - Name setup callback arguments and remove whitespace-only lines.
> - Update the description.
>=20
>  drivers/powercap/dtpm.c         | 180 +++++++++++++++-----------------
>  drivers/powercap/dtpm_cpu.c     |  62 ++++++++---
>  drivers/powercap/dtpm_devfreq.c |  22 ++--
>  drivers/soc/rockchip/dtpm.c     |  67 +++++++++---
>  include/linux/dtpm.h            |   6 +-
>  5 files changed, 198 insertions(+), 139 deletions(-)

I tried to follow along and the changes look ok, but I don't know the
more intricate details, so

Acked-by: Heiko Stuebner <heiko@sntech.de>




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93012606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aojsEtCx;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=VpISasGt;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=WPQqpMNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=utpAkiwFHBjBDfI84DKHsLpQh91ULE12v2wjMHOYcls=; b=aojsEtCx7AZ0qaKXL49U1YYf4D
	SLM3tv+EO+fyTNqjKMinh+ORt1pqMFsYp7Dv9vMc3cDF9SipYUiLVAdORZzADvS2i4ohOSarIoJaU
	008o7u8G6kuskX7nFMZ8DyoRzQVLqE3wOqNrPPqWY4ms3++5NT/Ly7VlOYsDxqNcncBfRtCA8u1EE
	KV3vFOJbu93FVK+ZWxAk34ZY5QAw6A7/W1WrrJqI+bvK3WXA5zdQcykYE6k3eAGbRGZMRAO75nNYH
	WVtT60REjUhAzN/LEbDbM1yLpAVai+lKCqg7aY1lUFrNbvdfwIP7LD0UABPMFcL07+ZLXY8he81FU
	Vef/fSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTS38-00000007GRR-2LX6;
	Tue, 17 Nov 2026 22:53:14 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTS35-00000007GR2-3Nr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:53:13 +0000
DKIM-Signature: a=rsa-sha256; b=VpISasGt6hFOUpKJTSi8dBra3gbAk0b9ucNeEEkvSqEDrMQnNovWvDWBhHWiWmB45EPYqReyCK7Sn6X/U0djwvify9yCIB43hDeIbXKLHM5QYUUSRGJUzUid3yOjmEyDLYzhjxt1IXUfFaBOROF5X9yxvrvqn6DfiUsb4gpUlQoARK8KLCElCUCDYdQk8eGi96Bo9QQKXDi39+dxnydUF5ql3qVR/IuXM4iZI6ioJFs4l7aFD0rmLu/0RtbJMt1tsuA8PHouvRhjf9ZQFvzcssgv1IzBPrE9U/TMQ09b0Tu5iZkhLHc1P7LScvCpfmMt5NOde73baMDHiAKN/k9png==; s=purelymail1; d=sverdlin.org; v=1; bh=utpAkiwFHBjBDfI84DKHsLpQh91ULE12v2wjMHOYcls=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=WPQqpMNw/2XWir5D2XHi3oGT4BNQ0Vp9yoeFLqxVPB+h019xYU004bkv1X/PlsK67Dkdy0Hpo5UvS3N+yw9L6WJZ6iF+DP23jHF3CvXu8rvhhzBWA8YdUrpM482YqXQ0ZXQqbukhRsY/CtzdI3yjQ9dkV9eLUzPhdOJJT8LxHZkbRS/U4XovujIi3W6Lw5Fik9BatQ6tO+mRUeD+AGetIJ9lkmtcGhua93XPiJYItjVwwsGy58yR1mBIVCc1MqeOpGuJcvN/Dnr9dAAM22CR2snE5SGZh95gT6gUZfzjDsCU5y9XdoUck1nhVyt73hHcUoda3qWDI6XEJtvZ18DbhA==; s=purelymail1; d=purelymail.com; v=1; bh=utpAkiwFHBjBDfI84DKHsLpQh91ULE12v2wjMHOYcls=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 150623937;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 22:53:04 +0000 (UTC)
Message-ID: <f7752d1d155491876ae5d4bc1694c01c8d86b789.camel@sverdlin.org>
Subject: Re: [PATCH 5/6] arm64: dts: allwinner: a133: Add CPU OPP table
From: Alexander Sverdlin <alex@sverdlin.org>
To: rajanyadav0307@gmail.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>
Date: Tue, 17 Nov 2026 23:52:52 +0100
In-Reply-To: <20261104-a133-series-v1-5-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
	 <20261104-a133-series-v1-5-58217cb33a87@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_145312_127167_A1600EAB 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Rajan!

On Wed, 2026-11-04 at 22:41 -0600, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>=20
> Add the A133 CPU OPPs from the vendor BSP (sun50iw10p1.dtsi). There
> are ten voltage sets, speed0-5 for the a0-a5/a6 grades and speed6-9
> for the "high speed" b0-b3 grades. opp-supported-hw selects the
> frequencies of each grade:
>=20
> - 1464 MHz only for the a grades
> - 1416 and 1512 MHz only for the b grades
> - 408-1320 MHz for all
>=20
> The highest voltage is 1.18 V, inside the 0.81-1.2 V recommended
> operating range of VDD_CPU in the A133 datasheet (V1.5, table 5-2).
>=20
> The BSP uses 1008 MHz where the A100 table uses 1080 MHz, at the same
> voltages for a0-a2. U-Boot starts the CPU at 1008 MHz, which mainline
> now reports as an unlisted initial frequency. This table follows the
> BSP. The BSP table stops at 1512 MHz, so there is no 1608 MHz OPP,
> although some datasheet versions list 1.6 GHz for the A133. A newer
> factory kernel adds 1608 MHz for b0 and b1 only; that is left for a
> follow-up.
>=20
> The table has the A100 compatible as a fallback and the speed bin cell
> first, so a kernel without A133 support selects speed0-2 from the speed
> bin and gets the voltages of the A100 table, with 1008 instead of
> 1080 MHz. It needs the efuse cells added to sun50i-a100.dtsi in the
> previous patch.
>=20
> A script compared every voltage and the frequency set of every grade
> with the BSP file and found no difference.
>=20
> Claude Code (Anthropic) drafted this table and its message from the
> vendor BSP device tree (numbers only) and wrote the comparison script;
> I reviewed it and tested it on a KickPi K5C.
>=20
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0.../boot/dts/allwinner/sun50i-a133-cpu-opp.dtsi=C2=A0=C2=A0=C2=A0 |=
 172 +++++++++++++++++++++
> =C2=A01 file changed, 172 insertions(+)


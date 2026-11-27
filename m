Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VPQYXo56;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AMyJGtPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=54NOpbOtuKLqL2nKVOoPWau8pDlerFu1Y4blbqD/sNI=; b=VPQYXo56Fw6qOc
	cy1CXkk7syDGIBAN1M+gECnn3RIhZhepA3C046qMO47zxzqOLJGrLEzy6KYrxw3Z4HoCanMaJ+Pd5
	krZ9H+bdj+CeUCMV2YWwrCi0Xj0bdKirFk3HUvCKItir9Ar0vfo3QeRAwZJC46S3s3jepM8IFbFWs
	kuaFr3d+aMY5BpOvkh1EUYkNHXa0BfldS6JmDe7VecGPxl561GcfnoZ8ganrvuk4P5Xrx5G0GI92a
	Kw0VlR0OUvFPfb2sm2YdadS15MizN+YYM6Bn65GrIEcO6xAzmbY6M3sm/Og6n39gUrhDx2d1UZYe+
	7WhJ1KCz+giSEKxdLHVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyqP-0000000H5fC-42CK;
	Fri, 27 Nov 2026 16:30:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyqJ-0000000H5cW-1pKg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:30:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627D71570;
	Fri, 27 Nov 2026 08:30:31 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE823F86F;
	Fri, 27 Nov 2026 08:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795797034; bh=b33/9jIn33AHiLVOktQcqCtJ8czOf9Xr7CxwoHhocU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AMyJGtPhp4st87WhHQjG9x2Xm7CAavKQX7s8SJQATPgdBrrVhcClJ0J2GhoBiahLO
	 YvNt3wdAsddMsQHGJy9k1qlZDj30gapE55u/Ux9lTxZIdoAVJDljuAI3+ZIP8fg7o4
	 7ubxHpqKGnQP7cEVxWdQ48ojV+YXZX7+soqu8Li8=
Message-ID: <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
Date: Fri, 27 Nov 2026 16:30:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
To: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
 <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com>
 <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_083035_560950_F17EA9CF 
X-CRM114-Status: GOOD (  18.25  )
X-Spam-Score: -4.4 (----)
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

Hi Norman,

(please try to reply in-line, with the question quoted, to make it 
easier for other people to follow the thread)

On 11/27/26 17:17, Norman Herms wrote:
> Hi Andre,
> 
> On the ELDO1 question: the AXP318W datasheet (V1.0, Chinese, table
> 6-3) gives ELDO1 a default of 0.9 V and leaves it off at power-up, as it
> does DCDC6 and DCDC7. So 1.075 V is not the PMIC default.

Ah, thanks!
> On the A7S we boot our own chain (U-Boot SPL calling the vendor DRAM
> init, TF-A, U-Boot), and none of the open parts writes ELDO1. That
> leaves the vendor DRAM init, which switches it on. Its value follows
> VDD2H on the 25 mV grid: with DCDC7 at 1080 mV we read ELDO1 at
> 1075 mV, and with Radxa's own boot0 at 1120 mV we read 1100 mV.

That's good info, thanks!

> We have also tried VDD2L at 0.9 V on the A7S. Lowering ELDO1 from
> Linux changes the voltage after the DRAM training ran at 1.075 V,
> which can lead to errors.

Yeah, I was concerned about this as well. LPDDR5 DRAM init/training 
seems to be a lot more sensitive than <=LPDDR4 (it even requires 
occasional retraining at runtime?), so changing voltages after the fact 
sounds dangerous.

> So we keep the value the DRAM init leaves,
> even though it does not match the schematic, as the v6 node without
> voltage bounds does. The vendor DRAM init sets all the DRAM rails
> itself, so a clean 0.9 V would have to come from there.

OK, that's something we probably can do with the in-flight Open Source 
DRAM init driver then, which is (in parts at least) already on the list.

Regardless I wouldn't want to leave it completely unbound, but instead 
provide some limits. I guess for VDD2L, potentially the same as VDD2H, 
it should be 0.87V - 1.12V, which seem to be limits Google turns up for 
those LPDDR5 specified values.

I will adjust the DT for the A7A.

Cheers,
Andre



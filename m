Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCnrZYDY;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VG4FDJAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BuPepjdXAchlZ0/rdmklLt9a4OqDms3VeAyOyVVTjdU=; b=uCnrZYDYvv/duW
	VoIawSgo4bNxyxZuJgdS0z2bA9H7mlm8SYj/+rRzAcSCJ95kQXRNl+NkxPpZjjq41DUMtDoko9/1f
	8P8+MK5SPbGSTcoPg2MX5eRsUsOo0ksgLCRVT0Q9pnp6POEtBMXjlSIFBmeK9TYngr8mwD92vOj6X
	tvarkwlqWhMuHNY79TV34PGczT96gpdc6S0Zwqs46ipc692JR+XBZReD/XJDpmxjaUsCJTTFzQVmn
	JL4ETbs+5oHZIgdNya4FPlVL4ZsWlyzfQwuBK2sZGtZWHnBaMwXS8JHJ8/kzor6tqIQoRpQcUVGAX
	L2LrYXnZpEijkIvdp2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDNi-0000000A2uU-3SaH;
	Wed, 25 Nov 2026 13:49:54 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDNe-0000000A2rV-1nNV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795614584; x=1795873784;
	bh=BuPepjdXAchlZ0/rdmklLt9a4OqDms3VeAyOyVVTjdU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VG4FDJANG6JEbv/1Mwb2lTT0CY6hhvcXxLMEZV0//O4YGYscqkRzEVesPF03ipVGU
	 ECWyheGAc7f32lOi9FLmumMc5d5/tm/AxV4gllixFPjGC/BtEqh896ltoIzLBsTlpq
	 672pBW2z6Tz4EJ49qCWEUee4dU/V1BYGkOgWnYgfzS70Oy1dUz5z+Tqp27c+1NSvVK
	 n+iKMNmpI7kBQyXcpZsW2vc7xrzCSz7Af4e6sHwLAfptzPPQnriLnH1YNBFJsgXXs2
	 1A/fO5Pa5RUWqZ+TUndzTLEioSB//GmSIXsPU09AbUKez8lJY5iH6U5zZcCorPB5Tg
	 Hepbut9OX0Xjg==
Date: Wed, 25 Nov 2026 13:49:26 +0000
To: Alexey Charkov <alchark@flipper.net>
From: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the CPU ID
Message-ID: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net> <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 9e804900875c1d7029fee4789a2fc3b0fde23519
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_054950_784748_B1DD79A8 
X-CRM114-Status: GOOD (  32.99  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexey,

On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipper=
.net> wrote:

> Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> ID in the OTP memory and patch them into the device tree they pass on.
> Kernels started any other way, e.g. straight from the SPL in Falcon
> mode, end up with random addresses which change on every boot, even
> though the CPU ID is just as readable from Linux.
>=20
> Implement the derivation for cells marked as "rockchip,cpuid", handing
> the result to consumers which ask for the cell as "mac-address", such as
> of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> so that the same cell keeps serving the ID itself.
>=20
> Follow U-Boot's rockchip_setup_macaddr() exactly, so that both yield the
> same addresses: hash the CPU ID's lowercase hex string with SHA-256,
> take the first six octets as a unicast, locally administered address,
> and XOR the cell argument into the last octet, which is how U-Boot gets
> eth1addr from ethaddr.
>=20
> Put the address in the first six octets and keep the cell at the size
> of the CPU ID, as NVMEM cells have a fixed size and MAC address
> consumers accept a longer cell.
>=20
> Hooking the derivation into the OTP provider rather than a separate
> layout means it works with any fixed layout of the OTP cells, and needs
> no per-SoC knowledge, as the cell already gives the CPU ID's location.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/nvmem/Kconfig        |  4 +++-
>  drivers/nvmem/rockchip-otp.c | 48 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb236663..5776d4e4b391 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -448,9 +448,11 @@ config NVMEM_ROCKCHIP_OTP
>  =09tristate "Rockchip OTP controller support"
>  =09depends on ARCH_ROCKCHIP || COMPILE_TEST
>  =09depends on HAS_IOMEM
> +=09select CRYPTO_LIB_SHA256
>  =09help
>  =09  This is a simple driver to dump specified values of Rockchip SoC
> -=09  from OTP, such as cpu-leakage.
> +=09  from OTP, such as cpu-leakage. It also derives stable Ethernet MAC
> +=09  addresses from the CPU ID, as Rockchip bootloaders do.
>=20
>  =09  This driver can also be built as a module. If so, the module
>  =09  will be called nvmem_rockchip_otp.
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 7eb834516ab4..eb91e7a34051 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -6,9 +6,12 @@
>   * Author: Finley Xiao <finley.xiao@rock-chips.com>
>   */
>=20
> +#include <crypto/sha2.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/etherdevice.h>
> +#include <linux/hex.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> @@ -67,6 +70,8 @@
>  #define RK3588_AUTO_EN=09=09=09BIT(0)
>  #define RK3588_RD_DONE=09=09=09BIT(1)
>=20
> +#define ROCKCHIP_CPUID_LEN=09=0916
> +
>  struct rockchip_data {
>  =09int size;
>  =09int read_offset;
> @@ -319,6 +324,48 @@ static int rockchip_otp_read(void *context, unsigned=
 int offset,
>  =09return ret;
>  }
>=20
> +/*
> + * Derive a MAC address from the CPU ID the same way Rockchip bootloader=
s do
> + * (see rockchip_setup_macaddr() in U-Boot's arch/arm/mach-rockchip/boar=
d.c),
> + * for consumers asking for one. Everyone else gets the CPU ID unchanged=
.
> + *
> + * The address takes the first six octets of the cell, which keeps the s=
ize of
> + * the CPU ID. Consumers only look at those, so the rest is left as it i=
s.
> + *
> + * The cell argument is XORed into the last octet rather than added to t=
he
> + * address, matching how U-Boot derives eth1addr from ethaddr.
> + */
> +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> +=09=09=09=09 unsigned int offset, void *buf, size_t bytes)
> +{
> +=09char cpuid[ROCKCHIP_CPUID_LEN * 2];
> +=09u8 digest[SHA256_DIGEST_SIZE];
> +=09u8 *mac =3D buf;
> +
> +=09if (!id || strcmp(id, "mac-address"))
> +=09=09return 0;
> +
> +=09if (bytes !=3D ROCKCHIP_CPUID_LEN || index < 0 || index > U8_MAX)
> +=09=09return -EINVAL;
> +
> +=09bin2hex(cpuid, buf, ROCKCHIP_CPUID_LEN);
> +=09sha256(cpuid, sizeof(cpuid), digest);
> +
> +=09memcpy(mac, digest, ETH_ALEN);
> +=09mac[0] &=3D 0xfe;=09=09/* clear the multicast bit */
> +=09mac[0] |=3D 0x02;=09=09/* set the locally administered bit */
> +=09mac[5] ^=3D index;
> +
> +=09return 0;
> +}
> +
> +static void rockchip_otp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> +=09=09=09=09=09    struct nvmem_cell_info *cell)
> +{
> +=09if (of_device_is_compatible(cell->np, "rockchip,cpuid"))
> +=09=09cell->read_post_process =3D rockchip_otp_cpuid_pp;
> +}
> +
>  static struct nvmem_config otp_config =3D {
>  =09.name =3D "rockchip-otp",
>  =09.owner =3D THIS_MODULE,
> @@ -328,6 +375,7 @@ static struct nvmem_config otp_config =3D {
>  =09.stride =3D 1,
>  =09.word_size =3D sizeof(u8),
>  =09.reg_read =3D rockchip_otp_read,
> +=09.fixup_dt_cell_info =3D rockchip_otp_fixup_dt_cell_info,
>  };
>=20
>  static const char * const px30_otp_clocks[] =3D {
>=20
> --
> 2.56.0
>=20
>=20

Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S

I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the MAC=
 address was exactly as expected.

Looking forward to using this.

Best regards,
Ryan

